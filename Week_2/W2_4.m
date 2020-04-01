clc;
clear all;
close all;
n=8;
Nr=512;
Nc=512;

RGB = (imread('Lena.png')); 
YCbCr = rgb2ycbcr(RGB);
Y1 = YCbCr(:,:,1);
Cb1 = YCbCr(:,:,2);
Cr1= YCbCr(:,:,3);

Inv1 = cat(3, double(Y1), Cb1, Cr1);
Inv1 = ycbcr2rgb(Inv1);

figure
imagesc((Inv1));
axis off
title("Inv1");

N1=1;
N2=300;
N3=1;

for x=1:n:Nc
    for y=1:n:Nr
        A = Y1(x:x+n-1,y:y+n-1);
        A=round(dct2(A)./N1).*N1;
        Y2(x:x+n-1,y:y+n-1)=idct2(A);
        
        B = Cb1(x:x+n-1,y:y+n-1);
        B=round(dct2(B)./N2).*N2;
        Cb2(x:x+n-1,y:y+n-1)=idct2(B);
        
        C = Cr1(x:x+n-1,y:y+n-1);
        C=round(dct2(C)./N3).*N3;
        Cr2(x:x+n-1,y:y+n-1)=idct2(C);
        
    end
end


Inv2 = cat(3, uint8(Y2), uint8(Cb2), uint8(Cr2));
Inv2 = ycbcr2rgb(Inv2);

figure
imagesc((Inv2));
axis off
title("Inv2");