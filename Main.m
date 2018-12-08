% =======
close all
clear all


lowpolify('img1.jpg',0.03,'sobel',1200,0.97,5, 0.8);

% %main file to execute triangulation
% orig_img = imread('img3.jpg');
% %orig_img = imread('img2.jpg');
% fh1 = figure();
% 
% fil_img = magicfil(orig_img);
% imshow(fil_img);
% %blur_img = imresize(blur_img,0.3);
% corners = detectHarrisFeatures(fil_img);
% hold on; plot(corners.selectStrongest(100));
% thresh = 0.15;
% edge_img = edge(fil_img,'canny', thresh);
% imshow(edge_img);
% % 
% [dt, V] = triangulate(edge_img,800);
% colored_img = colorization(orig_img,dt);
% 
% imshow(colored_img);
% % figure();
% % triplot(dt);
% % hold on
% % scatter(V(:,1),V(:,2),'filled','r');
% %triplot(dt1);
% >>>>>>> ac1a42f57160b55062c230802f0120bbf59178a6
% 
% 
