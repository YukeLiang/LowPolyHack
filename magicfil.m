function fil_img = magicfil(orig_img, input_DoS, input_SS, input_sigma, input_scale)

if nargin > 1
    DoS = input_DoS; % Degree of smoothing, specified as a positive number
    if nargin > 2
        SS = input_SS; % SpatialSigma, standard deviation of spatial Gaussian smoothing kernel specified as a positive number (default = 1)
        if nargin > 3
            sigma = input_sigma; % Standard deviation, specified as a positive number (default = 0.5)
            if nargin > 4
                scale = input_scale; % Image scaler
            else
                scale = 1;
            end
        else
            sigma = 1;
            scale = 1;
        end
    else
        SS = 10;
        sigma = 1;
        scale = 1;
    end
else
    DoS = 1000;
    SS = 10;
    sigma = 1;
    scale = 1;
end

% Denoise with bilateral filter
blur_img = imbilatfilt(orig_img, DoS, SS);

% Denoise with gaussian filter
k = ceil(2*pi*sigma);
h = fspecial('gaussian', [k k], sigma);
blur_img = imfilter(blur_img, h, 'conv', 'replicate');

% Increase contrast
adjusted_img = imadjust(blur_img,[0.25 0.8]); % Check: https://www.mathworks.com/help/images/ref/imadjust.html#budqw0o-1-low_inhigh_in

% Convert into grayscale
gray_img = rgb2gray(adjusted_img);

% Increase contrast
adjusted_img = imadjust(gray_img,[0 0.85],[0.15 1]); % Check website above

fil_img = adjusted_img;

end