% Bluring image

Bluring_kernel=(1/100 )*ones(10,10);

%------------------------

%Bluring the gray image
Blured_gray_image = conv2( Gray_double,Bluring_kernel);
figure;
imshow(Blured_gray_image);

%-------------------------

%Bluring the original image

figure;

Blured_red_image=conv2(Red_double,Bluring_kernel);
Blured_blue_image=conv2(Blue_double,Bluring_kernel);
Blured_green_image=conv2(Green_double,Bluring_kernel);

Blured_image =cat(3,Blured_red_image,Blured_green_image,Blured_blue_image);
imshow(Blured_image);
