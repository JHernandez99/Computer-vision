clc;
clear all;
close all;

im = imread('carreteraColor.png');
size(im);
figure(1);
imshow(im(:,:,1)); %para que de solo la capa uno    %R
figure(2);
imshow(im(:,:,2));                                  %G
figure(3);
imshow(im(:,:,3));                                  %B

img = rgb2gray(im); %imagen rgb a escala de grises
figure(4);
imshow(img);
title('Imagen en escala de grises');
size(img) %para ver las capas

%nivel de intensidad de imagen
imshow(im)
img(90 ,482,:) %Para sacar el valor de intensidad en cualquier punto de la imagen 
                %esto ya imprime las capas de la imagen 


