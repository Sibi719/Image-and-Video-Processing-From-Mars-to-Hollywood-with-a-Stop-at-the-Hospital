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

O=I;
blocksize=3;
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
   temp=0;
   for m=a(1):a(length(a))
       for n= b(1):b(length(b))
           temp=temp+double(I(m,n));
       end
   end
   temp=temp/(length(a)*length(b));
   O(i,j)=temp;
   end
end


figure
imagesc(O);
axis off
title("Output image");
colormap(gray);
