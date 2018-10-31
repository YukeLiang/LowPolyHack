function fil_img = magicfil(orig_img)

% Denoise with bilateral filter
DoS = 8000;
blur_img = imbilatfilt(orig_img,DoS,10);

% Denoise with gaussian filter
sigma = 0.5;
k = ceil(2*pi*sigma);
h = fspecial('gaussian', [k k], sigma);
blur_img = imfilter(blur_img, h, 'conv', 'replicate');

% Increase contrast
adjusted_img = imadjust(blur_img,[0.25 0.8]);

% Convert into grayscale
gray_img = rgb2gray(adjusted_img);

% Increase contrast
adjusted_img = imadjust(gray_img,[0 0.85],[0.15 1]);

img_resized = imresize(adjusted_img, 0.5);
% img_resized = imresize(adjusted_img, [200 (200 / size(adjusted_img,1) * size(adjusted_img,2))]);

fil_img = img_resized;

end