% figure();
% 
% P = gallery('uniformdata',[30 2],0);
% 
% plot(P);


orig_img = imread('img1.jpg');
figure();
%denoise with gaussian filter
sigma = 2;
% Rule of thumb: set kernal size k ~= 2*pi*sigma
k = ceil(2*pi*sigma);
% Generate a Gaussian kernal 
h = fspecial('gaussian', [k k], sigma);
%h = fspecial('sobel');
    
% Perform convolution 
blur_img = imfilter(orig_img, h, 'conv', 'replicate');
    
% Display the result
imshow(blur_img); 
title(['\sigma = ' num2str(sigma)]);

%blur_img = imresize(blur_img,0.3);
gray_img = rgb2gray(blur_img);
thresh = 0.3;
edge_img = edge(gray_img,'canny', thresh);
imshow(edge_img);

[X,Y] = find(edge_img);

%triangulation
dt = delaunayTriangulation(X,Y);
dt1 = delaunay(X,Y);
triplot(dt);
triplot(dt1);
figure();
imshow(orig_img);
plot();




