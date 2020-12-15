clear,
close all,
clc,

addpath 'Data' ;

N=95; %unit�
I = double(imread('Capture.jpg'));
[h,w,z] = size(I);
sigmaG = 1.5;
sigmaT = 1.25;

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


%% Segmentation en r�gions d'int�r�t

[Ix,Iy] = gradient(imgY,sigmaG);
omega = pond_omega(sigmaT);
Tx = Tenseur(omega,Ix,Ix);
Ty = Tenseur(omega,Iy,Iy);
Txy = Tenseur(omega,Ix,Iy);


D = zeros(h,w);
for i=1:h
    for j=1:w
        D(i,j)=sqrt((Tx(i,j)-Ty(i,j))^2 + 4*Txy(i,j)^2)/(Tx(i,j)+Ty(i,j));
    end
end
 
figure, imshow(D)

% 
% figure,H = histogram(D,256);
% crit = critere( H.Values, 256);
% value = (H.BinEdges(crit)+H.BinEdges(crit+1))/2;
% im = value > D;
% 
% figure, imshow(im)



