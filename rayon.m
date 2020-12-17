clear,clc
close all

addpath 'Data' ;

N=95; %unité
I = double(imread('img.png'));
[h,w,z] = size(I);
correct =0;

while(correct~=1)
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
    Npts = floor(distAB*5);
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

    %% Otsu
    [crit,indice] = critere( H.Values, 256);
    figure,plot(crit),
    xlim([40,250]),title("Critère d'Otsu")
    value = (H.BinEdges(indice)+H.BinEdges(indice+1))/2;
    binarisation = im  > value;

    %Début et fin effectifs du code barre
    for i=1:length(binarisation)
        if(binarisation(i) == 0)
            A_eff = samples(:,i);
            break;
        end
    end
    i = length(binarisation);
    while (i~=1)
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

    %%
     I_code=[binarisation_eff(3*unit_base+1:45*unit_base) binarisation_eff(50*unit_base+1:end-3*unit_base)];
     [chiffres,famille,ressemblance] = chiffrement(I_code,unit_base);
     chiffre_tot = [chiffre_famille(famille(1:6)) chiffres];
     
      %% Clé de contrôle
    key=0;
    for i=1:6
        key = key + chiffre_tot(2*i-1)+3*chiffre_tot(2*i);
    end

    if(10-mod(key,10)==chiffre_tot(13))
        correct = 1;
    end
end