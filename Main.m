%main file to execute triangulation
%orig_img = imread('Test_Pic.png');
orig_img = imread('img1.jpg');
%orig_img = imread('img2.jpg');
fh1 = figure();

fil_img = magicfil(orig_img);

%blur_img = imresize(blur_img,0.3);
corners = detectHarrisFeatures(fil_img);
hold on; plot(corners.selectStrongest(100));
thresh = 0.3;
edge_img = edge(fil_img,'canny', thresh);
imshow(edge_img);
% 
[dt, V] = triangulate(edge_img,800);

triplot(dt);
hold on
scatter(V(:,1),V(:,2),'filled','r');
%triplot(dt1);


