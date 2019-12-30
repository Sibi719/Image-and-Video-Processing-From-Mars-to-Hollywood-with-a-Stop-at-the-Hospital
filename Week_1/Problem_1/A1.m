clc;
clear all;
close all;

NLevels=4; %%Input the number of levels of quantization(2,4,8,16...256)

N=log2(NLevels);


I= imread('D:\Coursera\Image and video processing\Lena.png'); %512*512 lena image from wikepedia
I= rgb2gray(I);
figure
imagesc(I);
axis off
title("Input Image");
colormap(gray);

O=I;
Quant=floor(linspace(double(min(I(:))),double(max(I(:))),NLevels))

for i=1:length(Quant)-1
    
    lim1=Quant(i);
    lim2=Quant(i+1);
    mid=(lim1+lim2)/2;
    O(O>=lim1 & O<mid ) = lim1;
    O(O>=mid & O<=lim2 ) = lim2;
end

    
figure
imagesc(O);
axis off
title("Output image");
colormap(gray);
    
[C]=unique(O,'stable');
