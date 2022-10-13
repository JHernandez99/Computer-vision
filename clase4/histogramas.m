close all;
clear all;

im = imread('brillo.pgm');
[u,v,ch] = size(im);
imAj=imadjust(im,[],[],0.4);
figure(1);
imshowpair(im,imAj,'montage');
title('Image Correccion');

him = imhist(im);
himA =imhist(imAj);

figure(2);
imhist(im);
title('Histograma');

figure(3);
imhist(imAj);
title('Histograma correccion gamma');


figure(4);
hq =histeq(im);
imhist(hq);
title('Histograma ecualizado')

figure(5)
imshow(hq)
title('Imagen Ecualizada')


