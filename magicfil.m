function fil_img = magicfil(orig_img)

% Denoise with bilateral filter
DoS = 8000; % Degree of smoothing, specified as a positive number
SS = 10; % SpatialSigma, standard deviation of spatial Gaussian smoothing kernel specified as a positive number (default = 1)
blur_img = imbilatfilt(orig_img, DoS, SS);

% Denoise with gaussian filter
sigma = 1; % Standard deviation, specified as a positive number (default = 0.5)
k = ceil(2*pi*sigma);
h = fspecial('gaussian', [k k], sigma);
blur_img = imfilter(blur_img, h, 'conv', 'replicate');

% Increase contrast
adjusted_img = imadjust(blur_img,[0.25 0.8]); % Check: https://www.mathworks.com/help/images/ref/imadjust.html#budqw0o-1-low_inhigh_in

% Convert into grayscale
gray_img = rgb2gray(adjusted_img);

% Increase contrast
adjusted_img = imadjust(gray_img,[0 0.85],[0.15 1]); % Check website above

% Rescale the image
scale = 0.6;
img_resized = imresize(adjusted_img, scale);
% img_resized = imresize(adjusted_img, [250 (250 / size(adjusted_img,1) * size(adjusted_img,2))]);

fil_img = img_resized;

end