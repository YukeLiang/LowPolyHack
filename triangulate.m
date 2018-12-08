% total_vertices --> the maximum number of vertices
function [tri_img, edge_vertices] = triangulate(orig_img,edge_img, total_vertices,...
    ratio,min_distance,sig_points,FeatureRatio)
    

    imgcorners = detectHarrisFeatures(edge_img);
    %the rate of edge points vs non-edge point 
    % ratio = # of edge point * Ratio_Thres / # of non-edge points
    % works fine b/w 75 - 125
    Ratio_Thres = ratio;
    min_Dis = min_distance; %unit ==>Pixels
    
    %output = zeros(size(edge_img,1),size(edge_img,2));
    vertices = zeros(total_vertices, 2);
        
    [X,Y] = find(edge_img);
    %disp([X,Y]);
    [XX,YY] = find(~edge_img);
    
    Ratio = min(size(X,1) * Ratio_Thres / (size(XX,1) * ( 1 - Ratio_Thres)),0.8);
    
    num_vertices = floor(total_vertices*Ratio);   
    v_index_edge = uint16(linspace(1,size(X,1),num_vertices) );
% =======
%     num_vertices = ceil(total_vertices*Ratio);  
%     num_edge = 500; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     v_index_edge = randperm(size(X,1),num_edge);
% >>>>>>> ac1a42f57160b55062c230802f0120bbf59178a6
    v_index_nonedge = randperm(size(XX,1),total_vertices - num_vertices);
    
    count = 1;
    location = imgcorners.selectStrongest(uint16(num_vertices * FeatureRatio));
    k =  [double(location.Location(:,2)), double(location.Location(:,1))];
    vertices = [vertices;k];%zeros(total_vertices, 2);
    figure();
    imshow(edge_img);
  
    hold on; plot(location);
%     count = size(imgcorners,1)+1;
    
    for i = 1:num_vertices
        X1 = X(v_index_edge(i));
        Y1 = Y(v_index_edge(i));
        if(~ifNear(vertices, X1,Y1, min_Dis))
            vertices = [vertices ; [X1,Y1]];
            count = count + 1;
        end
    end
    figure();
    
    for i = 1: (total_vertices - num_vertices)
        vertices(num_vertices+i,:) = [XX(v_index_nonedge(i)),YY(v_index_nonedge(i))];
    end
    
    vertices =  cat(1, vertices, sig_points);
    output = delaunayTriangulation(vertices);
    tri_img = output;
    edge_vertices = vertices(1:num_vertices,:);
    
    colored_img = colorization(orig_img,tri_img);
    figure();
    

    imshow(colored_img);
    %hold on;imshow(edge_img);
    hold on; plot(location);
end


%if it is too close to current points
function Close = ifNear(vertices, X1, Y1, T)
    Close = 0;  
    for j = 1 : size(vertices,1)
        
         X2 = vertices(j,1);
         
         Y2 = vertices(j,2);
        if(sqrt(((X1-X2).^2) + ((Y1-Y2).^2)) <  T)
            Close = 1;
        end
    end
end
