clear,
close all,
clc,

addpath 'Data' ;

N=95; %unités

I = double(imread('beurre.jfif'));
[h,w,z] = size(I);
sigmaG = 0.8;
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


%% Segmentation en régions d'intérêt

[Ix,Iy] = gradient(imgY,sigmaG);
omega = pond_omega(sigmaT);
T =Tenseur(omega,1,7,Ix,Iy);

% for i=1:h
%    for j=1:w
%         D(i,j) = coherence(omega,i,j,Ix,Iy);
%     end
% end
% 
% 






