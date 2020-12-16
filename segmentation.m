clear,
close all,
clc,

addpath 'Data' ;

N=95; %unité
I = double(imread('auch.jpg'));
[h,w,z] = size(I);
sigmaG = 1.5;
sigmaT = 0.5;

if ( z==1) 
    imgY = I;
    figure, imagesc(imgY,[0 1]), colormap(gray(256)),
else  %image en vraies couleurs
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);
    imgY = 0.299*R + 0.587*G + 0.114*B;
    figure, imshow(uint8(imgY)),
end


%% Segmentation en régions d'intérêt

[Ix,Iy] = gradient(imgY,sigmaG);
omega = pond_omega(sigmaT);
Tx = Tenseur(omega,Ix,Ix);
Ty = Tenseur(omega,Iy,Iy);
Txy = Tenseur(omega,Ix,Iy);


D = sqrt((Tx-Ty).^2 + 4*Txy.^2)./(Tx+Ty);
figure,imshow(D)


seuil = max(max(D))*0.99;
D_bin = seuil > D;

figure,imshow(D_bin)

