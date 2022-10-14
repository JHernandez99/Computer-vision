close all;
clear all;
clc;

im = imread('bananaBinario.png');
im = rgb2gray(im);
im = 1 - im;
figure(1)
imshow(single(im));

[u,v] = size(im);
m  = zeros(3,3);
imC = zeros(u,v);

for i = 1:u-2
    for j=1:v-2
        m(:,:)=im(i:i+2, j:j+2);
        sigma = sum(m(:))- m(2,2);
        if m(2,2) == 0
            imC(i+1,j+1)=0;
        else
            if sigma < 8
                imC(i+1,j+1)=0;
            else
                imC(i+1, j+1) = 1;
            end
        end
    end
end

figure(2)
imshow(single(imC))
title('Adelgazar o contraer')

