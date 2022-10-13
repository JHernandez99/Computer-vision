
%correccion de gamma

close all;
clear all;

imge = imread('contrasM.png');

[u,v,ch] = size(imge);
imGamma  = imadjust(imge,[],[],0.3);
figure(4);
imshowpair(imge, imGamma, 'montage');
title('Imagen Correccion');

