%getting a gray image out of the original one
grey_image=rgb2gray(peppers_img);

%-----------------------------------------------------------

%Converting image components into double
 Red_double=im2double(red_component);
 Blue_double=im2double(blue_component);
 Green_double=im2double(green_component);
 Gray_double= im2double(grey_image);

 %---------------------------------------------------------
 
%Edge Detection
Edge_Detection_kernel=[
    0   0   0    0    -1  0   0   0  0
    0   0   0    0,  -1  ,0   0   0  0 ;
    0   0   0    0   -1   0   0   0  0;
    0   0   0    0   -1   0   0   0  0;
   -1  -1  -1   -1   16  -1  -1  -1 -1;
    0   0   0    0   -1   0   0   0  0 ;
    0   0   0    0   -1   0   0   0  0 ;
    0   0   0    0   -1   0   0   0  0;
    0   0   0    0   -1   0   0   0  0 ];


%--------------------------

%Edge detection for a gray image

Gray_edge_detection = conv2( Gray_double,Edge_Detection_kernel); 
figure;
imshow(Gray_edge_detection);

%--------------------------
%Edge detection for the original image
figure;
Red_edge_detectioned_image=conv2(Red_double,Edge_Detection_kernel);
Blue_edge_detectioned_image=conv2(Blue_double,Edge_Detection_kernel);
Green_edge_detectioned_image=conv2(Green_double,Edge_Detection_kernel);

Img_processed =cat(3,Red_edge_detectioned_image,Green_edge_detectioned_image,Blue_edge_detectioned_image);
imshow(Img_processed);


%--------------------------------------------------------
