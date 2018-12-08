
%----------------------- 
% Image processing: convolution, Gaussian smoothing
%-----------------------
% I5mage credit: http://commons.wikimedia.org/wiki/File:Beautiful-pink-flower_-_West_Virginia_-_ForestWander.jpg

% Image credit: CAVE Lab

img = imread('img4.jpg');
fh = figure;

method_list = {'Sobel'  , 'Prewitt' , 'Roberts' , 'log' , 'zerocross' , 'Canny' , 'approxcanny'};
thres_list = { 0.1, 0.1,0.15,0.005,0.005,0.3,0.3 };

gray_img = rgb2gray(img); 
subplot(2, 4, 1); imshow(gray_img); title('Color Image');

% First original figure
for i = 1:length(method_list)
    thresh = thres_list{i};

    edge_img = edge(gray_img,method_list{i}, thresh);
    
    k = 2;
    
    %TODO #2
    
    % Erode and Dilate Noise Elimination --- less satisifying
    %edge_img = bwmorph(edge_img, 'dilate', k);
    %edge_img = bwmorph(edge_img, 'erode', k);

    subplot(2, 4, i+1); imshow(edge_img); title(method_list{i} );
end


% Resized Figure
fh2 = figure;
img_resized = imresize(img, 0.3);

gray_img = rgb2gray(img_resized); 
subplot(2, 4, 1); imshow(img_resized); title('Resized Color Image');


for i = 1:length(method_list)
    thresh = thres_list{i};

    edge_img = edge(gray_img,method_list{i}, thresh);
    subplot(2, 4, i+1); imshow(edge_img); title(method_list{i} );
end
