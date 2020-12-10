clear,clc
close all

addpath 'Data' ;

N=95; %unités

I = double(imread('ean13.jpg'));
[h,w,z] = size(I);

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

%% Lancer aléatoire d'un rayon
[A,B] = ginput(2);
C = A;
A = [A(1),B(1)];
B = [C(2),B(2)];

line(A,B)
distAB = sqrt((B(2)-A(2))^2+(B(1)-A(1))^2);
Npts = floor(distAB*2);
samples = zeros(2,Npts);
for i=1:Npts
    samples(:,i) = A+i/Npts*(B-A);
    
end

u=1;
v=1;
for i=1:length(samples(1,:))
    im(u,v) = imgY(round(samples(1,i)),round(samples(2,i)));
    v= v+1;
end

figure,plot(im);
[min1,argmin1] = min(im(1:floor(length(im)/3)));
[min2,argmin2] = min(im(floor(2*length(im)/3) : length(im)));


%Début et fin effectifs du code barre
A_eff = samples(:,argmin1);
B_eff = samples(:,floor((length(im))/2) +argmin2);

% Nouveau Echantillonnage

distAB_eff = sqrt((B_eff(2)-A_eff(2))^2+(B_eff(1)-A_eff(1))^2);

Npts = N;
samples_eff = zeros(2,Npts);
for i=1:Npts
    samples_eff(:,i) = A_eff+i/Npts*(B_eff-A_eff);
    
end

%interpolation
u=1;
v=1;
for i=1:length(samples_eff(1,:))
    im_eff(u,v) = imgY(round(samples_eff(1,i)),round(samples_eff(2,i)));
    v= v+1;
end


figure,
H = histogram(im_eff,256);

crit = critere( H.Values, 256);
value = (H.BinEdges(crit)+H.BinEdges(crit+1))/2;

binarisation = im_eff  > value;
%plot(binarisation);




