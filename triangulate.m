% total_vertices --> the maximum vertice point it has
function [tri_img, edge_vertices] = triangulate(edge_img, total_vertices)
    
    %the rate of edge points vs non-edge point 
    % ratio = # of edge point * Ratio_Thres / # of non-edge points
    % works fine b/w 75 - 125
    Ratio_Thres = 0.96;
    min_Dis = 10; %unit ==>Pixels
    
    %output = zeros(size(edge_img,1),size(edge_img,2));
    corners = [1,1;
               1,size(edge_img,2);
               size(edge_img,1),1;
               size(edge_img,1),size(edge_img,2)];
    
    [X,Y] = find(edge_img);
    [XX,YY] = find(~edge_img);
    
    Ratio = size(X,1) * Ratio_Thres / (size(XX,1) * ( 1 - Ratio_Thres));
    
    num_vertices = ceil(total_vertices*Ratio);   %half
    v_index_edge = randperm(size(X,1),num_vertices);
    v_index_nonedge = randperm(size(XX,1),total_vertices - num_vertices);
    vertices = zeros(total_vertices, 2);
    
    count = 1;
    
    for i = 1:num_vertices
        X1 = X(v_index_edge(i));
        Y1 = Y(v_index_edge(i));
        if(~ifNear(vertices, X1,Y1, min_Dis))
            vertices(count,:) = [X1,Y1];
            count = count + 1;
        end
    end
    figure();
    edge_vertices = vertices;
    
    for i = 1: (total_vertices - num_vertices)
        vertices(num_vertices+i,:) = [XX(v_index_nonedge(i)),YY(v_index_nonedge(i))];
    end

    cat(1, vertices, corners);
    output = delaunayTriangulation(vertices);
    tri_img = output;
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