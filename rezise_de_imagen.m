%Redimensionado de una imagen
im = imread('image5.jpg');
figure(1);
imshow(im);                 %tamaño de la imagen a la que queremos pasar
img1r = imresize(im,[480,640]);
figure(2);
imshow(img1r);
title('recortada');



