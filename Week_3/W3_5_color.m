clc;
clear all;
close all;

I= imread('Lena.png');

figure
imshow((I),[],'InitialMagnification', 800);
title("Input Image");
axis off


[R,G,B]=imsplit(I);
M =[0 0 0; 0 -1 1; 0 0 0];

Rx=conv2(R,M,'same');
Gx=conv2(G,M,'same');
Bx=conv2(B,M,'same');

figure
imshow((Rx),[],'InitialMagnification', 800);
title("Differential along x - Red");
axis off
figure
imshow((Gx),[],'InitialMagnification', 800);
title("Differential along x - Green ");
axis off

figure
imshow((Bx),[],'InitialMagnification', 800);
title("Differential along x - Blue");
axis off


M =[0 1 0; 0 -1 0; 0 0 0];

Ry=conv2(R,M,'same');
Gy=conv2(G,M,'same');
By=conv2(B,M,'same');

figure
imshow((Ry),[],'InitialMagnification', 800);
title("Differential along y - Red");
axis off
figure
imshow((Gy),[],'InitialMagnification', 800);
title("Differential along y - Green");
axis off

figure
imshow(By,[],'InitialMagnification', 800);
title("Differential along y - Blue ");
axis off

Rg=sqrt(Rx.^2+Ry.^2);
Gg=sqrt(Gx.^2+Gy.^2);
Bg=sqrt(Bx.^2+By.^2);

figure
imshow((Rg),[],'InitialMagnification', 800);
title("Gradient magnitude - Red");
axis off

figure
imshow((Gg),[],'InitialMagnification', 800);
title("Gradient magnitude - Green");
axis off

figure
imshow((Bg),[],'InitialMagnification', 800);
title("Gradient magnitude - Blue");
axis off



Gradient=cat(3,uint8(Rg),uint8(Gg),uint8(Bg));

figure
imshow((Gradient),[],'InitialMagnification', 800);
title("Gradient magnitude - color");
axis off
%%

I=double(I);
[R,G,B]=imsplit(I);


[RX,RY] = imgradientxy(R);
[GX,GY] = imgradientxy(G);
[BX,BY] = imgradientxy(B);


figure
imshow((RX),[],'InitialMagnification', 800);
title("Differential along x ");
axis off
figure
imshow((GX),[],'InitialMagnification', 800);
title("Differential along x ");
axis off

figure
imshow((BX),[],'InitialMagnification', 800);
title("Differential along x ");
axis off


figure
imshow((RY),[],'InitialMagnification', 800);
title("Differential along y ");
axis off
figure
imshow((GY),[],'InitialMagnification', 800);
title("Differential along y ");
axis off

figure
imshow(BY,[],'InitialMagnification', 800);
title("Differential along y ");
axis off

Rg=sqrt(RX.^2+RY.^2);
Gg=sqrt(GX.^2+GY.^2);
Bg=sqrt(BX.^2+BY.^2);

figure
imshow((Rg),[],'InitialMagnification', 800);
title("Gradient magnitude - Red");
axis off

figure
imshow((Gg),[],'InitialMagnification', 800);
title("Gradient magnitude - Green");
axis off

figure
imshow((Bg),[],'InitialMagnification', 800);
title("Gradient magnitude - Blue");
axis off


Gradient=cat(3,uint8(Rg),uint8(Gg),uint8(Bg));
figure
imshow((Gradient),[],'InitialMagnification', 800);
title("Gradient magnitude - Color");
axis off
