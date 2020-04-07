clc;
clear all;
close all;

I = imread('Lena.png');
I=(rgb2gray(I));
figure
imshow(I,[], 'InitialMagnification', 800);
axis off
title("Input image");

d=0.1;

Ins=imnoise(I,'salt & pepper',d);
figure
imshow(Ins,[], 'InitialMagnification', 800);
title("Input Image with salt&pepper noise");

d=0.01;
Ing=imnoise(I,'gaussian',0,d);
figure
imshow(Ing,[], 'InitialMagnification', 800);
title("Input Image with gaussian noise");
