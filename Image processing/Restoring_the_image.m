
%Adjusting the size of the motion_bluring kernel to suit the divisioin in
%frequency domain

The_widened_motion_bluring_kernel=zeros(size(Motion_blured_image,1),size(Motion_blured_image,2));
The_widened_motion_bluring_kernel(1,1:50)=Motion_bluring_kernel;


%-------------------------------------------------------------------

%Reconstructing the image from the motion-blured one in frequency domain

%Converting into Fourier domain

Frequency_domain_motion_blured_kernel=fft2(The_widened_motion_bluring_kernel);
Frequency_domain_motion_blured_red_image=fft2(Motion_blured_red_image);
Frequency_domain_motion_blured_blue_image=fft2(Motion_blured_blue_image);
Frequency_domain_motion_blured_green_image=fft2(Motion_blured_green_image);
Frequency_domain_motion_blured_gray_image=fft2(Motion_blured_gray_image);

%---------------------------------------


%Getting the original image in fourier domain


reconstructed_red_in_frequendy_domain=Frequency_domain_motion_blured_red_image./Frequency_domain_motion_blured_kernel;
reconstructed_blue_in_frequency_domain=Frequency_domain_motion_blured_blue_image./Frequency_domain_motion_blured_kernel;
reconstructed_green_in_frequency_domain=Frequency_domain_motion_blured_green_image./Frequency_domain_motion_blured_kernel;
reconstructed_gray_in_frequency_domain=Frequency_domain_motion_blured_gray_image./Frequency_domain_motion_blured_kernel;

%-----------------------------------------

%Getting inverse Fourier Transform of the image

Reconstructed_red=ifft2(reconstructed_red_in_frequendy_domain);
Reconstructed_green=ifft2(reconstructed_green_in_frequency_domain);
Reconstructed_blue=ifft2(reconstructed_blue_in_frequency_domain);
Reconstructed_gray=ifft2(reconstructed_gray_in_frequency_domain);

Reconstructed_gray=Reconstructed_gray(1:384,1:512,:);
%------------------------------------------

%The reconstructed image

Reconstructed_image=cat(3,Reconstructed_red,Reconstructed_green,Reconstructed_blue);

Reconstructed_image=Reconstructed_image(1:384,1:512,:);

%-------------------------------------

%displaying the original image besides the motion_blured and reconstructed
%one

figure;
subplot(1,3,1);
imshow (peppers_img);
fontsize= 18;
title('Original Image');

subplot(1,3,2);
imshow (Motion_blured_image);
fontsize= 18;
title('Motion-Blured  Image');

subplot(1,3,3);
imshow (Reconstructed_image);
fontsize= 18;
title('Reconstructed Image');

figure;
subplot(1,3,1);
imshow (grey_image);
fontsize= 18;
title('Original Gray Image');

subplot(1,3,2);
imshow (Motion_blured_gray_image);
fontsize= 18;
title('Motion-Blured Gray Image');

subplot(1,3,3);
imshow (Reconstructed_gray);
fontsize= 18;
title('Reconstructed Gray Image');