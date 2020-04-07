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
blocksize=3;
[O,J]= Medianfi(blocksize,g,f);
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