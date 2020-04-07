clc;
clear all;
close all;
I= imread('coins.png'); 
figure
imshow(I,[], 'InitialMagnification', 800);
title("Input Image");
colorbar

d=0.1;
In=imnoise(I,'salt & pepper',d);
figure
imshow(In,[], 'InitialMagnification', 800);
title("Input Image with noise");
colorbar

blocksize=2;
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

figure
imshow(O,[], 'InitialMagnification', 800);
axis off
title("Median filtered image");
colorbar

J = medfilt2(In,[blocksize blocksize ]);

figure
imshow(J,[], 'InitialMagnification', 800);
axis off
title("Median filtered image with matlab function");
colorbar;