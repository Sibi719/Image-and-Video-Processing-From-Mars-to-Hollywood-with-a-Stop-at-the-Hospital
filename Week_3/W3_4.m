clc;
clear all;
close all;
I= imread('cameraman.tif');

figure
imshow((I),[],'InitialMagnification', 800);
title("Input Image");
colormap(gray);

N=100;

for i=1:N
    In(:,:,i)=double(I)+60.*rand(size(I,1),size(I,2));
end

figure
imshow((In(:,:,1)),[],'InitialMagnification', 800);
title("Noisy Image");
colormap(gray);

I_new=zeros(size(I,1),size(I,2));
for i=1:N
    I_new= In(:,:,i)+I_new;
end

I_new=I_new./N;

figure
imshow((I_new),[],'InitialMagnification', 800);
title("Averaged Image");
colormap(gray);
