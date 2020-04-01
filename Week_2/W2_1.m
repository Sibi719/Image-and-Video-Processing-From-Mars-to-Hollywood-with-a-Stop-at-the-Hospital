clc;
clear all;
close all;
n=8;

I= imread('Lena.png');
I= rgb2gray(I);
imwrite(mat2gray(I), 'I.png');
figure
imagesc(I);
axis off
title("Input Image");
colormap(gray);

Nr=size(I,1);
Nc=size(I,2);
I_est=zeros(Nr,Nc);
Q = [ 16, 11, 10, 16, 24, 40, 51, 61; ...
       12, 12, 14, 19, 26, 58, 60, 55; ...
       14, 13, 16, 24, 40, 57, 69, 56; ...
       14, 17, 22, 29, 51, 87, 80, 62; ...
       18, 22, 37, 56, 68, 109, 103, 77; ...
       24, 35, 55, 64, 81, 104, 113, 92; ...
       49, 64, 78, 87, 103, 121, 120, 101; ...
       72, 92, 95, 98, 112, 100, 103, 99 ];

for x=1:n:Nc
    for y=1:n:Nr
        A = I(x:x+n-1,y:y+n-1);
        B=round(dct2(A)./Q).*Q;
        I_est(x:x+n-1,y:y+n-1)=idct2(B);
    end
end

figure
imagesc(I_est);
axis off
title("Estimated Image 1");
colormap(gray);
imwrite(mat2gray(I_est), 'I_est_1.png');

I_est=zeros(Nr,Nc);
N=8;
for x=1:n:Nc
    for y=1:n:Nr
        A = I(x:x+n-1,y:y+n-1);
        B=round(dct2(A)./N).*N;
        I_est(x:x+n-1,y:y+n-1)=idct2(B);
    end
end

figure
imagesc(I_est);
axis off
title("Estimated Image 2");
colormap(gray);
imwrite(mat2gray(I_est), 'I_est_2.png');

I_est=zeros(Nr,Nc);

for x=1:n:Nc
    for y=1:n:Nr
        A = I(x:x+n-1,y:y+n-1);
        T=dct2(A);
        [~,sortingIndex] = sort(T(:),'desc');
        [row, col] = ind2sub(size(T),sortingIndex(1:n));
        M= zeros(n);
        for i=1:n
          M(row(i),col(i))=1;
        end
       T = T.*M;
       T=round(T);
       I_est(x:x+n-1,y:y+n-1)=idct2(T);
    end
end

figure
imagesc(I_est);
axis off
title("Estimated Image 3");
colormap(gray);

imwrite(mat2gray(I_est), 'I_est_3.png');