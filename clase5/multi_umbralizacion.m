clear all;
close all;


im = imread('tapas.jpg');
img = imresize(im, [480,NaN]);
im = imresize(im, [480, NaN]);
img = rgb2gray(img);
[u,v,ch] = size(img);

figure(1)
imhist(img);
title('Histograma');

figure(2)

imshow(img);
title('Imagen Resize');


lv=3;
th = multithresh(img, lv);
imSeg = imquantize(img, th);

figure(3)
imshow(imSeg,[]);
title('Umbralizacion final');

figure(4)
imhist(imSeg);
title('Histograma de la segmentada');

%Busqueda del objeto de interés 
iMask = zeros(u,v);
iMask(imSeg == 2) = 1;

figure(5)
imshow(iMask);
title('Mascara');

figure(6)
imshow(iMask);
title('Imagen binaria');

p = bwareaopen(iMask, 11000);
figure(7)
imshow(p)
title('Extraccion con bwareaopen Mascara de la pieza')

a = regionprops(p);

figure(8)
imshow(im)
title('Imagen original');
hold on;
rectangle('Position', a(3).BoundingBox, 'EdgeColor','r','LineWidth',3);
plot(ceil(a(3).Centroid(1)),ceil(a(2).Centroid(3)), 'r*');
