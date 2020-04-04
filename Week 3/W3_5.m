clc;
clear all;
close all;
I= imread('coins.png');

figure
imshow((I),[],'InitialMagnification', 800);
title("Input Image");
axis off

M =[0 0 0; 0 -1 1; 0 0 0];
Ix=conv2(I,M,'same');
figure
imshow((Ix),[],'InitialMagnification', 800);
title("Differential along x ");
axis off

M =[0 1 0; 0 -1 0; 0 0 0];
Iy=conv2(I,M,'same');
figure
imshow((Iy),[],'InitialMagnification', 800);
title("Differential along y");
axis off

G1=sqrt(Ix.^2 + Iy.^2);

figure
imshow((G1),[],'InitialMagnification', 800);
title("Gradient magnitude");
axis off


[FX,FY] = gradient(double(I));

figure
imshow((FX),[],'InitialMagnification', 800);
title("Differential along x ");
axis off

figure
imshow((FY),[],'InitialMagnification', 800);
title("Differential along y ");
axis off

G2=sqrt(FX.^2 + FY.^2);

figure
imshow((G2),[],'InitialMagnification', 800);
title("Gradient magnitude");
axis off

%%%