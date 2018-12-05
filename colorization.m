function colored_img = colorization(orig_img,dt)
% Colorize the polygons
R_Channel = orig_img(:,:,1);
G_Channel = orig_img(:,:,2); 
B_Channel = orig_img(:,:,3); 
IC = round(incenter(dt),0);

% Retrieve RGB of the center of each triangle
RGB = zeros(size(IC,1),3);

for r = 1:size(IC,1)
    RGB(r,1) = orig_img(IC(r,1),IC(r,2),1);
    RGB(r,2) = orig_img(IC(r,1),IC(r,2),2);
    RGB(r,3) = orig_img(IC(r,1),IC(r,2),3);
end

% Loop over the new img to decide which triangle the pixel belongs to
for i = 1:size(orig_img,1)
  for j = 1:size(orig_img,2)
      t_id = pointLocation(dt,i,j);
      R_Channel(i,j) = RGB(t_id,1);
      G_Channel(i,j) = RGB(t_id,2);
      B_Channel(i,j) = RGB(t_id,3);
  end
end

colored_img = cat(3,R_Channel,G_Channel,B_Channel);
end

