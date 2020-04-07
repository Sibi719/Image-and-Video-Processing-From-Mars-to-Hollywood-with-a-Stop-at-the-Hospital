clc;
clear all;
close all;
I = (imread('Lena.png')); 
I = double(rgb2gray(I));
figure
imshow((I),[], 'InitialMagnification', 800);
title("Input Image");

edges =[-256:256];
figure
hI=histogram(I,edges);
title("Hisotgram of Input Image");
total=sum(hI.Values);
p=(hI.Values./total);
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
imshow((I_pred),[], 'InitialMagnification', 800);
title("Prediction based on just the pixel at (-1,0)");
colormap(gray);

figure
imshow((Error),[], 'InitialMagnification', 800);
title(" Error for prediction  based on just the pixel at (-1,0)");

edges =[-100:100];

figure
hI=histogram(Error,edges);
title(" Error histogram for prediction  based on just the pixel at (-1,0)");

total=sum(hI.Values);
p=(hI.Values./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)


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
imshow((I_pred),[], 'InitialMagnification', 800);
title("Prediction based on just the pixel at (0,1)");

figure
imshow((Error),[], 'InitialMagnification', 800);
title(" Error for prediction  based on just the pixel at (0,1)");

figure
hI=histogram(Error,edges);
title(" Error histogram for prediction  based on just the pixel at (0,1)");

total=sum(hI.Values);
p=(hI.Values./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)


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
imshow((I_pred),[], 'InitialMagnification', 800);
title("Predicting based on the average of the pixels at (-1,0), (-1,1), and (0,1)");
colormap(gray);

figure
imshow((Error),[], 'InitialMagnification', 800);
title("Error for predicting based on the average of the pixels at (-1,0), (-1,1), and (0,1)");

figure
hI=histogram(Error,edges);
title("Error histogram for predicting based on the average of the pixels at (-1,0), (-1,1), and (0,1)");

total=sum(hI.Values);
p=(hI.Values./total);
Ent=p.*log2(p);
Ent(isnan(Ent))=0;
Ent(isinf(Ent))=0;
Ent=-sum(Ent)
