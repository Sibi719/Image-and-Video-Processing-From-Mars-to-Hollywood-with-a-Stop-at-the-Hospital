clc;
clear all;
close all;

I = imread('coins.png'); 

figure
imshow(I,[], 'InitialMagnification', 800);
axis off
title("Input image");
colormap(gray);

h= histogram(I);
nbins = h.NumBins
dd=unique(h.Data)
hh=h.Values
VV=unique(I);

figure
histogram(I, 'EdgeColor', 'none');
title("Image histogram");


figure
stem(dd, nbins);
title("Image histogram");


total=sum(counts);
p=counts./total
L=256;

for i=1:size(I,1)
    for j=1:size(I,2)
        t=I(i,j);
         n=t+1;
       P=sum(p(1:n));
        HEI(i,j)= (L-1)*P;
    end
end



figure
imshow((HEI),[], 'InitialMagnification', 800);
axis off
title("Histogram equalized Image");

figure
imhist(uint8(HEI));
title("Image histogram");

