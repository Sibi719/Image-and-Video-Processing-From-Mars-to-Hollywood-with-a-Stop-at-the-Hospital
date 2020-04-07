clc;
clear all;
close all;
f=imread("L.png");
f=(rgb2gray(f));
figure
imshow(f,[], 'InitialMagnification', 800);colormap(gray);colorbar
hsize=[size(f,1),size(f,2)];
sigma=3;
h = fspecial('gaussian',hsize,sigma);
figure
imshow(h,[], 'InitialMagnification', 800); colorbar
F=fftshift(fft2(f));
H=fftshift(fft2(h));
g= ifftshift(ifft2(ifftshift((F.*H))));
noisse=(rand(size(f,1),size(f,2)).*sqrt(10));
figure
imshow(noisse,[], 'InitialMagnification', 800);colormap(gray);colorbar
g=g+noisse;
figure
imshow(g,[], 'InitialMagnification', 800);colormap(gray);colorbar
k=0.005;
W= (conj(H)./(abs(H).^2 + k));
G=fftshift(fft2(g));
O=ifftshift(ifft2(ifftshift(W.*G)));
figure
imshow(O,[], 'InitialMagnification', 800);
colormap(gray);colorbar
