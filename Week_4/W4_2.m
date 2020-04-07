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
imshow(Ins,[], 'InitialMagnification', 800);title("Input Image with salt&pepper noise");
blocksize=3;
[O,J]= Medianfi(blocksize,Ins,I);
figure
imshow(O,[], 'InitialMagnification', 800);title("Median filtered image");
d=0.01;
Ing=imnoise(I,'gaussian',0,d);
figure
imshow(Ing,[], 'InitialMagnification', 800);title("Input Image with gaussian noise");
[O,J]= Medianfi(blocksize,Ing,I);
figure
imshow(O,[], 'InitialMagnification', 800);title("Median filtered image");



function [O,J]= Medianfi(blocksize,In,I)

if (mod(blocksize,2))
left_count= floor(blocksize/2);
right_count=floor(blocksize/2);
up_count= floor(blocksize/2);
down_count=floor(blocksize/2);
else
right_count= floor(blocksize/2);
left_count=floor(blocksize/2)-1;
down_count= floor(blocksize/2);
up_count=floor(blocksize/2)-1;
end

for i=1:size(I,1)
    for j=1:size(I,2)
   a=i-up_count: i+down_count;
   b=j-left_count: j+right_count;
   a(a<1 | a>size(I,1))=[];
   b(b<1 | b>size(I,2))=[];
   A = In(a,b);
   B = reshape(A,[1,numel(A)]);
   B= sort(B(:),'ascend');
   O(i,j)=median(B);
   end
end

J = medfilt2(In,[blocksize blocksize]);

end