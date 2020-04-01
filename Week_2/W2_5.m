clc;
clear all;
close all;
n=8;
Nr=512;
Nc=512;

I = (imread('Lena.png')); 
I = im2double(rgb2gray(I));

figure
imagesc((I));
axis off
title("I");
colormap(gray);

[counts,binLocations] = imhist(I);

total=sum(counts);

figure
imhist(I);

p=(counts./total);

Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)



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
imagesc((I_pred));
axis off
title("I");

colormap(gray);

figure
imagesc((Error));
axis off
title("I");

colormap(gray);

[counts,binLocations] = imhist(Error);
total=sum(counts);
p=(counts./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)

figure
imhist(Error);

for i=1:size(I,1)
    for j=1:size(I,2)
        nr=i-1;
        nc=j;
        if(nr<1)
            nr=1;
        end
        I_pred(i,j)=I(nr,nc); 
    end
end

Error= (I_pred-I);
figure
imagesc((I_pred));
axis off
title("I");

colormap(gray);

figure
imagesc((Error));
axis off
title("I");

colormap(gray);

[counts,binLocations] = imhist(Error);
total=sum(counts);
p=(counts./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)

figure
imhist(Error);

for i=1:size(I,1)
    for j=1:size(I,2)
        nr1=i-1;
        nc1=j;
        
        nr2=i;
        nc2=j-1;
        
        nr3=i-1;
        nc3=j-1;
        
        a = [nr1 nc1 nr2 nc2 nr3 nc3];
        
        a(a<1)=1;
             
        val= I(a(1),a(2)) + I(a(3),a(4)) + I(a(5),a(6));
        val = val./3;
        I_pred(i,j)=val; 
    end
end
Error= (I_pred-I);
figure
imagesc((I_pred));
axis off
title("I");

colormap(gray);

figure
imagesc((Error));
axis off
title("I");

colormap(gray);

[counts,binLocations] = imhist(Error);
total=sum(counts);
p=(counts./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)

figure
imhist(Error);