clc;
clear all;
close all;
I= imread('cameraman.tif');

figure
imshow((I),[],'InitialMagnification', 800);
title("Input Image");


In= imnoise(I,'gaussian',0,0.005);

figure
imshow((In),[],'InitialMagnification', 800);
title("Input Image with noise");

blocksize=4;
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
           temp=temp+double(In(m,n));
       end
   end
   temp=temp/(length(a)*length(b));
   Av(i,j)=temp;
   end
end

figure
imshow((Av),[],'InitialMagnification', 800);
title("Smoothed image");

h=10;
blocksize=100;
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
        p=In(i,j);
        Bp=Av(i,j);
   a=i-up_count: i+down_count;
   b=j-left_count: j+right_count;
   a(a<1 | a>size(I,1))=[];
   b(b<1 | b>size(I,2))=[];
   Dev=abs(Av(a,b)-Bp).^2;
   f=exp(-Dev./(h.^2));
   Cp=sum(sum(f));
   O(i,j)=sum(sum(double(In(a,b)).*f))./Cp;
    end
end

figure
imshow((O),[], 'InitialMagnification', 800);
axis off
title("Non local means average image");
