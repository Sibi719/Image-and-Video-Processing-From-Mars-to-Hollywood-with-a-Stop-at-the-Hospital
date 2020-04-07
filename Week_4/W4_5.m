clc;
clear all;
close all;
hsize=100;
sigma=0.1;
f=imread("L.png");
f=(rgb2gray(f));
figure
imshow(f,[], 'InitialMagnification', 800);colormap(gray);colorbar

N=10;
for i=1:N
    I(:,:,i)=f;
end

for i=1:N
    an=rand(1).*20;
    a = 1; b = -1;
    in = (b-a).*rand(1) + a;
    R=imrotate(I(:,:,i),in*an,'bicubic','loose');    
    d=0.01;
    R=imnoise(R,'gaussian',0,d);
    
figure
imshow( R,[], 'InitialMagnification', 800);colormap(gray);colorbar
    if(i==1)
        fixed=R;
        MM= zeros(size(R,1),size(R,2));
    else
        moving=R;
    end
    if(i>1)
     [optimizer, metric] = imregconfig('monomodal');

      
     OO = imregister(moving, fixed, 'affine', optimizer, metric);
          MM=double(MM)+double(OO);

    end
end
    
    
figure
imshow( MM./N,[], 'InitialMagnification', 800);colormap(gray);colorbar
title('Output Image');
