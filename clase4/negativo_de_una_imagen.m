clear all;
clc;
close all;

img  = imread('fruit005.bmp');
figure(1);
imshow(img);
title('Imagen en negativo');

[u,v,ch] = size(img); 

%if ch == 3 
%   img = rgb2gray(img); 
%end

%    L = max(max(img));
    
    L1 = max(max(img(:,:,1)));
    L2 = max(max(img(:,:,2)));
    L3 = max(max(img(:,:,3)));

%imNeg = zeros(u,v,ch); %Esto genera el espacio para la imagen
%imNeg = L-img;
imNeg(:,:,1) = L1-img(:,:,1);
imNeg(:,:,2) = L2-img(:,:,2);
imNeg(:,:,3) = L3-img(:,:,3);


figure(2);
imshow(imNeg);
title('Imagen Negativa');

figure(3)
imshowpair(img,imNeg,'Montage');
title('Resultado'); 






