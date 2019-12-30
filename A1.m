clc;
clear all;
close all;

NLevels=2;
N=log2(NLevels);


I= imread('D:\Coursera\Image and video processing\Lena.png'); 
I= rgb2gray(I);
figure
imagesc(I);
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
colormap(gray);
    
[C,idx]=unique(O,'stable');%don't sort
% 
% midvalue=  2^(8-N);
% O= floor(I./midvalue).*midvalue;
% O(O==128) = 0;
% 
%     
% figure
% imagesc(O);
% colormap(gray);
%     
% [C,idx]=unique(O,'stable');%don't sort

%thresh= floor(linspace(double(min(I(:))),double(max(I(:))),NLevels));
% 
% [quant8_I_max, index] = imquantize(I,thresh,valuesMax);
% 
% figure
% imagesc(quant8_I_max);
% colormap(gray);
% 
% 
% thresh = multithresh(I,NLevels);
% valuesMax = [thresh max(I(:))]
% [quant8_I_max, index] = imquantize(I,thresh,valuesMax);
% valuesMin = [min(I(:)) thresh]
% quant8_I_min = valuesMin(index);
% imshowpair(quant8_I_min,quant8_I_max,'montage') 
% title('Minimum Interval Value           Maximum Interval Value')
% 
% 
% 
% 
% 
% 
% 
% IL=linspace(0,255,NLevels);
% IL=floor(IL);
% thresh = multithresh(I,1);
% 
% val=(2^(8-N+1));
% 
% i=2;
% lev(1)=0;
% while lev<(256-val)
%    
%     lev(i)=lev(i-1)+val;
%     i=i+1;
% end


