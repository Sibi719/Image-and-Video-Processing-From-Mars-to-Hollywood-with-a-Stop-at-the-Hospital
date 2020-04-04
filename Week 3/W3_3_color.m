clc;
clear all;
close all;
I= imread('2.jpg');


figure
imshow((I),[],'InitialMagnification', 800);
title("Input Image");

In = imnoise(I,'gaussian',0,0.008);
figure
imshow((In),[], 'InitialMagnification', 800);
title("Input Image with noise");

[R,G,B]=imsplit(In);


 O1 = NLM(R,R);
  O2 = NLM(G,G);
  O3 = NLM(B,B);

  O = cat(3, uint8(O1), uint8(O2), uint8(O3));

figure
imshow((O),[], 'InitialMagnification', 800);
axis off
title("Non local means average image");

function O = NLM(In,I)

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
           temp=temp+double(In(m,n));
       end
   end
   temp=temp/(length(a)*length(b));
   Av(i,j)=temp;
   end
end

% figure
% imshow(uint8(Av),'InitialMagnification', 800);
% title("Smoothed image");
% colormap(gray);

h=20;
blocksize=40;
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

for i=1:size(In,1)
    for j=1:size(In,2)
        p=In(i,j);
        Bp=Av(i,j);
        a=i-up_count: i+down_count;
        b=j-left_count: j+right_count;
        a(a<1 | a>size(In,1))=[];
        b(b<1 | b>size(In,2))=[];
        Dev=abs(Av(a,b)-Bp).^2;
        f=exp(-Dev./(h.^2));
        Cp=sum(sum(f));
        O(i,j)=sum(sum(double(In(a,b)).*f))./Cp;
    end
end
end