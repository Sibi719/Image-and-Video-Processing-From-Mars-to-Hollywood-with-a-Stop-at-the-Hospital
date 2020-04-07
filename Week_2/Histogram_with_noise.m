clc;
clear all;
close all;
I = (imread('Lena.png')); 
I = double(rgb2gray(I));
figure
imshow((I),[], 'InitialMagnification', 800);
title("Input Image");

edges =[-500:500];
figure
hI=histogram(I,edges);
title("Hisotgram of Input Image");
total=sum(hI.Values);
p=(hI.Values./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)

Noise = 65 * randn(size(I,1), size(I,2));
In = I + Noise;

figure
hI=histogram(In,edges);
title("Hisotgram of Input Image with additive white noise");
total=sum(hI.Values);
p=(hI.Values./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)



d=0.02;
In =  imnoise(uint8(I),'salt & pepper',d);

figure
hI=histogram(In,edges);
title("Hisotgram of Input Image with salt and pepper noise");
total=sum(hI.Values);
p=(hI.Values./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)

In = imnoise(uint8(I),'gaussian',0,0.002);

figure
hI=histogram(In,edges);
title("Hisotgram of Input Image with gaussian noise");
total=sum(hI.Values);
p=(hI.Values./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)