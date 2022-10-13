%% Filtrar imagenes: promedio
clear all;
close all;
im = imread('color5.jpg');
imG = rgb2gray(im);
figure(1)
imshow(im)
title('imagen original')

h = fspecial('average', [15,15]);
imProm= imfilter(imG, h , 'replicate'); %replicate para que la img no pierda pixeles

figure(2)
imshowpair(imG,imProm, 'montage')
title('Imagen de filtro promedio')


%% Agregando ruido a la imagen Metricas de validacion
imNoi = imnoise(imG, 'salt & pepper' , 0.02);
%filtro de promedio
%imProm = imfilter(imNoi, h, 'replicate');

%filtro de mediana
imProm = medfilt2(imG, [15 15]);
figure(3)
imshowpair(imNoi,imProm, 'montage')
title('Imagen de filtro promedio en imagen ruidosa')



err = immse(imG, imNoi);
fprintf('\n The mean-squared error is %0.4f Real vs Ruido', err);

err = immse(imG, imProm);
fprintf('\n The mean-squared error is %0.4f Real vs Promedio', err);

[peaksnr, snr] = psnr(imG, imNoi);
fprintf('\n The Peak-SNR value Real vs Ruido is %0.4f',peaksnr); %decibeles
fprintf('\n The SNR value Real vs Ruido is %0.4f \n', snr); %decibeles

[peaksnr, snr] = psnr(imG, imProm);
fprintf('\n Thea Peak-SNR value Real vs Promedio is %0.4f', peaksnr);
fprintf('\n The SNR value Real vs Promedio is %0.4f \n', snr);

%% Diferencia de imagenes 

close all;
im = imread('frutas.png');
img =rgb2gray(im);
figure(1)
imshow(img)
title('imagen original gris')

h = fspecial('average', [41, 41]);
imProm = imfilter(img, h , 'replicate');
figure(2)
imshow(imProm)
title('filtro promedio')
imDiff = img - imProm;

figure(3)
imshow(imDiff)
title('Imagen diferencia quedan los bordes') 

figure(4)
mesh(double(imDiff)) %muestra los bordes de la imagen que se ve 

%% Eliminando detallas + y - representativos
img =imresize(img, [640,480]);
imgB = bitand(img, 240);
figure(5)
imshow(uint8(imgB));
title('Detalles + representativos')

imDiff2 = img - imgB;
figure(6)
imshow(uint8(imDiff2))
title('Imagen diff. 2, menos representativos')

L = 256;
imDifNeg = L - 1 - imDiff2;
figure(7)
imshow(imDifNeg)
title('Imagen diferencia 2 Negativa')

figure(8)
mesh(double(imgB))


