clc;
clear all;
close all;
I= imread('D:\Coursera\Image and video processing\Lena.png'); %512*512 lena image from wikepedia
I= rgb2gray(I);
figure
imagesc(I);
axis off
title("Input Image");
colormap(gray);
O= imrotate(I,-45);
figure
imagesc(O);
axis off
title("Output Image");
colormap(gray);
