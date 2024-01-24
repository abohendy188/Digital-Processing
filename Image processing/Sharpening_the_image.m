
%Sharpining image

Sharpening_Kernel =[0   0   0    0   -1   0   0   0  0 ;
    0   0   0    0,  -1  ,0   0   0  0 ;
    0   0   0    0   -1   0   0   0  0 ;
    0   0   0    0   -1   0   0   0  0 ;
   -1  -1  -1   -1   17  -1  -1  -1 -1 ;
    0   0   0    0   -1   0   0   0  0 ;
    0   0   0    0   -1   0   0   0  0 ;
    0   0   0    0   -1   0   0   0  0 ;
    0   0   0    0   -1   0   0   0  0 ];


%----------------------------

%%Sharpening the gray image

Gray_sharpened_image = conv2( Gray_double,Sharpening_Kernel);
figure;
imshow(Gray_sharpened_image);

%------------------------------

%%Sharping the original image

figure;
Red_sharpened_image=conv2(Red_double,Sharpening_Kernel);
Blue_sharpened_image=conv2(Blue_double,Sharpening_Kernel);
Green_sharpened_image=conv2(Green_double,Sharpening_Kernel);

Sharpened_image =cat(3,Red_sharpened_image,Green_sharpened_image,Blue_sharpened_image);
imshow(Sharpened_image);


