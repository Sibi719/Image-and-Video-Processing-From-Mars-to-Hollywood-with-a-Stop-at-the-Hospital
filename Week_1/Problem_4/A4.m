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

blocksize=5;

for i=1:blocksize:size(I,1)
    for j=1:blocksize:size(I,2)
       
   a=i:i+blocksize-1;
   b=j:j+blocksize-1; 
   a(a<1 | a>size(I,1))=[];
   b(b<1 | b>size(I,2))=[];
   temp=0;
   for m=a(1):a(length(a))
       for n= b(1):b(length(b))
           temp=temp+double(I(m,n));
       end
   end
   temp=temp/(blocksize^2);
   O(i,j)=temp;
    for m=a(1):a(length(a))
       for n= b(1):b(length(b))
          O(m,n)=temp;
       end
   end
   end
end
 
figure
imagesc(O);
axis off
title("Output image");
colormap(gray);
