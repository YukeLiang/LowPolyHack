function lp_img = lowpolify(file,edge_thresh,edge_style,...
    num_vertices,ratio,min_distance, FeatureRatio)
% file - image file name
% edge_thresh - Threshold for edge detection; the higher the more detailed
% edge_style - Edge detection mode
% num_vertices - Number of vertices for generating triangles, the more the
%                more precise
% ratio - The ratio of number of vertices on edge and not on edge
% min_distance - The minimum distance between each vertex

orig_img = imread(file);

fil_img = magicfil(orig_img);
% corners = detectHarrisFeatures(fil_img);
% hold on; plot(corners.selectStrongest(100));
thresh = edge_thresh;
edge_img = edge(fil_img,edge_style, thresh);
sig_points = [1,1;
               1,size(edge_img,2);
               size(edge_img,1),1;
               size(edge_img,1),size(edge_img,2)];
% sig_points = cat(1,sig_points, round(corners.Location,2));

% 
% [dt, V] = triangulate(edge_img,800);
[dt, V] = triangulate(orig_img,edge_img,num_vertices,ratio,min_distance,sig_points,FeatureRatio);
colored_img = colorization(orig_img,dt);

lp_img = colored_img;
end

