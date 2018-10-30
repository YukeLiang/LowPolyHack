function tri_img = triangulate(edge_img)
    output = zeros(size(edge_img,1),size(edge_img,2));
    corners = [1,1;
               1,size(edge_img,2);
               size(edge_img,1),1;
               size(edge_img,1),size(edge_img,2)];
    
    [X,Y] = find(edge_img);
    [XX,YY] = find(~edge_img);
    num_vertices = 500;   %half
    v_index_edge = randperm(size(X,1),num_vertices);
    v_index_nonedge = randperm(size(XX,1),num_vertices);
    vertices = zeros(2.*num_vertices, 2);
    
    for i = 1:num_vertices
        vertices(i,:) = [X(v_index_edge(i)),Y(v_index_edge(i))];
    end

    for i = 1:num_vertices
        vertices(num_vertices+i,:) = [XX(v_index_nonedge(i)),YY(v_index_nonedge(i))];
    end

    cat(1, vertices, corners);
    output = delaunayTriangulation(vertices);
    tri_img = output;
end