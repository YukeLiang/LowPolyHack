% total_vertices --> the maximum number of vertices
function [tri_img, edge_vertices] = triangulate(edge_img, total_vertices)

    hitmap = zeros(size(edge_img, 1), size(edge_img, 2));
        
    [X,Y] = find(edge_img);
    
    num_vertices = size(X, 1); 
    vertices = zeros(num_vertices, 2);
    corners = [1,1;
               1,size(edge_img,2)/2;
               1,size(edge_img,2);
               size(edge_img,1)/2,1;
               size(edge_img,1),1;
               size(edge_img,1)/2,size(edge_img,2);
               size(edge_img,1),size(edge_img,2)/2
               size(edge_img,1),size(edge_img,2)];
    vertices = cat(1, vertices, corners);
    
    proximity = 24;
    for i = 1:num_vertices
        x = X(i);
        y = Y(i);
        if hitmap(x, y) == 0
            for xi = -proximity:proximity
                for yi = -proximity:proximity
                    if x+xi > 0 && x+xi <= size(edge_img,1) && y+yi > 0 && y+yi <= size(edge_img,2)
                        hitmap(x+xi, y+yi) = 1;
                    end
                end
            end
            vertices(i,:) = [x,y];
        end
    end
    figure();

    %vertices_yx = [vertices(:,2), vertices(:,1)];
    output = delaunayTriangulation(vertices);
    tri_img = output;
    edge_vertices = vertices(1:num_vertices,:);
end
