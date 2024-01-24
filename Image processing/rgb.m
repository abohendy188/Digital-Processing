peppers_img=imread('peppers.png');

%-----------------------------------------------------------------------

%Extracting the three color components

red_component=peppers_img(:,:,1);%red component of the image
green_component=peppers_img(:,:,2);%green component of the image
blue_component=peppers_img(:,:,3);%red component of the imageSeS

%---------------------------------------------------------------------

%Creating a black image

Black= zeros(size(peppers_img,1),size(peppers_img,2));

%---------------------------------------------------------------------

%Creating colored images of the image

red_image =cat(3,red_component,Black,Black);
green_image =cat(3,Black,green_component,Black);
blue_image =cat(3,Black,Black,blue_component);

%---------------------------------------------------------------------

%Displaying color components 

subplot(1,3,1)
imshow (red_image)
fontsize= 18;
title('Red component');
subplot(1,3,2)
imshow (green_image)
fontsize= 18;
title('Green component');

subplot(1,3,3)
imshow (blue_image)
fontsize= 18;
title('Blue component');
