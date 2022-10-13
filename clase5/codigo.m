clear all;
close all;


im = imread('fruit005.bmp');
img = imresize(im, [480,NaN]);
img = rgb2gray(img);
[u,v,ch] = size(img);

figure(1)
imhist(img);
title('Histograma');

figure(2)

imshow(img);
title('Imagen Resize');


lv=1;
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
iMask(imSeg<=lv) = 1;

figure(5)
imshow(iMask);
title('Mascara');

figure(6)
imshow(iMask);
title('Imagen binaria');

p = bwareaopen(iMask, 4000);
figure(7)
imshow(p)
title('Extraccion con bwareaopen Mascara de la pieza')

a = regionprops(p);

figure(8)
imshow(im)
title('Imagen original');
hold on;
rectangle('Position', a.BoundingBox, 'EdgeColor','r','LineWidth',3);
plot(ceil(a.Centroid(1)),ceil(a.Centroid(2)), 'r*');





