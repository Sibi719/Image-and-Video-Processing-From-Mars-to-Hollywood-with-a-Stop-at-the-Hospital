clc;
clear all;
close all;
n=8;
Nr=512;
Nc=512;

I = (imread('Lena.png')); 
I = double(rgb2gray(I));
figure
imshow((I),[], 'InitialMagnification', 800);
title("I");

Er=round((randn(size(I,1),size(I,2))*sqrt(10^3)));
I=double(I);
[counts,binLocations] = imhist(I);
total=sum(counts);
[ eh ] = err_hist(I );
figure
plot(eh(1,:), eh(2,:));
x=reshape(eh(1,:),size(eh(1,:),2),1);
y=reshape(eh(2,:),size(eh(1,:),2),1);
ff=fit(x,y,'cubicinterp');

figure
plot(ff,x,y);

for i=1:size(I,1)
    for j=1:size(I,2)
        nr=i;
        nc=j-1;
        if(nc<1)
            nc=1;
        end
        I_pred(i,j)=I(nr,nc); 
    end
end

Error= (I_pred-I);
figure
imshow((I_pred),[], 'InitialMagnification', 800);
title("I");
colormap(gray);

figure
imshow((Error),[], 'InitialMagnification', 800);
title("I");
[counts,binLocations] = imhist(Error);
total=sum(counts);
p=(counts./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)


[ eh ] = err_hist(Error );
figure
plot(eh(1,:), eh(2,:));

x=reshape(eh(1,:),size(eh(1,:),2),1);
y=reshape(eh(2,:),size(eh(1,:),2),1);
ff=fit(x,y,'cubicinterp');

figure
plot(ff,x,y);


function [ h ] = err_hist( E )

depth = 256;
h = zeros(2, 2*depth-1);
h(1, :) = (-depth+1) : (depth-1);
im_min = min(min(E));

im_max = max(max(E));
i=1;
for v = im_min : im_max
    h(2, depth+v) = sum(sum(E==v));
    i=i+1;
end  

end