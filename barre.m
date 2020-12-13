clear,clc
close all

addpath 'Data' ;

N=95; %unité
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

line(A,B)
distAB = sqrt((A(2)-A(1))^2+(B(2)-B(1))^2);
Npts = floor(distAB*2);
samples = zeros(2,Npts);
for i=0:Npts-1
    samples(:,i+1) = [A(1);B(1)]+i/(Npts-1)*([A(2);B(2)]-[A(1);B(1)]);
    
end

%interpolation
v=1;
im = zeros(1,length(samples(1,:)));
for i=1:length(samples(1,:))
    im(1,v) = imgY(round(samples(2,i)),round(samples(1,i)));
    v= v+1;
end
figure,plot(im);
figure,
H = histogram(im,256);

%Otsu
crit = critere( H.Values, 256);
value = (H.BinEdges(crit)+H.BinEdges(crit+1))/2;
binarisation = im  > value;

%Début et fin effectifs du code barre
for i=1:length(binarisation)
    if(binarisation(i) == 0)
        A_eff = samples(:,i);
        break;
    end
end
i = length(binarisation);
while (i~=0)
    if(binarisation(i) == 0)
        B_eff = samples(:,i);
        break;
    end
    i = i-1;
end


% Nouveau Echantillonnage

distAB_eff = sqrt((B_eff(2)-A_eff(2))^2+(B_eff(1)-A_eff(1))^2);
unit_base = floor(distAB_eff/95);
Npts = unit_base*N;
samples_eff = zeros(2,Npts);

for i=0:Npts-1
    samples_eff(:,i+1) = A_eff+i/(Npts-1)*(B_eff-A_eff);  
end
%interpolation
v=1;
im_eff = zeros(1,length(samples_eff(1,:)));
for i=1:length(samples_eff(1,:))
    im_eff(1,v) = imgY(round(samples_eff(2,i)),round(samples_eff(1,i)));
    v= v+1;
end
binarisation_eff = im_eff  > value;

I_code_str=[];
for i=1:length(binarisation_eff)/4
    if(binarisation_eff(4*i)==0)
       I_code_str=[I_code_str 'N'];
    else
       I_code_str=[I_code_str 'B'];
    end
end


%I_code=I_code_str(:,4:end);
%chiffre1=chiffrement(I_code);
%I_code2=I_code_str(:,51:end);
%chiffre2=chiffrement(I_code2);
I_code=[I_code_str(:,4:45) I_code_str(:,51:end)];
chiffres=chiffrement(I_code);
famille=premier_chiffre(I_code);
first_number=chiffre_famille(famille);
chiffres=[first_number chiffres];


