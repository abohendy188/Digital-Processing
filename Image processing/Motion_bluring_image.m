%Motion bluring 

Motion_bluring_kernel=(1/50)*ones(1,50)

%----------------------------

%Motion blur of gray image

Motion_blured_gray_image = conv2( Gray_double,Motion_bluring_kernel);
figure;
imshow(Motion_blured_gray_image);

%-----------------------------

%Motion blur of the original image


figure;

Motion_blured_red_image=conv2(Red_double,Motion_bluring_kernel);
Motion_blured_blue_image=conv2(Blue_double,Motion_bluring_kernel);
Motion_blured_green_image=conv2(Green_double,Motion_bluring_kernel);

Motion_blured_image =cat(3,Motion_blured_red_image,Motion_blured_green_image,Motion_blured_blue_image);
imshow(Motion_blured_image);
