clear,
close all,
clc,

addpath 'Data' ;

N=95; %unité
I = double(imread('auch.jpg'));
[h,w,z] = size(I);
sigmaG = 1.2;
sigmaT = 8;

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
figure,imshow(Ix,[min(Ix(:)) max(Ix(:))])
figure,imshow(Iy,[min(Ix(:)) max(Ix(:))])

D = sqrt((Tx-Ty).^2 + 4*Txy.^2)./(Tx+Ty);
figure,imshow(D)


seuil = max(max(D))*0.8;
D_bin = D > seuil;

figure,imshow(D_bin)

%%
L = bwlabel(D_bin);
Xm=zeros(max(L(:)),1); 
Ym=zeros(max(L(:)),1);
for i=1:max(L(:))
    [x,y]=find(L==i);
    Xm(i,1)=mean(x);
    Ym(i,1)=mean(y);
    C= 1/length(x)*[sum((x-Xm(i,1)).^2) sum((x-Xm(i,1)).*(y-Ym(i,1))); sum((x-Xm(i,1)).*(y-Ym(i,1))) sum((y-Ym(i,1)).^2)];
    [V,D]=eig(C);
    [vp,ivp]=max(max(D));
    [vp2,ivp2]=min(min(D));
    V2=V(:,ivp);
    V1=V(:,ivp2);
    project = projection(x,y,V2);
    project2 = projection(x,y,V1);
    longueur= max(project)-min(project);
    largeur = max(project2)-min(project2);
    
    if (longueur  >=95 && largeur >=longueur/2 )
        correct =0;
        n_lancer =0;
        while(correct ~=1 && 100 > n_lancer )
            angle = randi([-80,80]);
            n_lancer = n_lancer+1;
            x1 = min(-longueur*tand(angle)/2-1 + Ym(i,1),h);
            y1 = min(-longueur/2-1 +Xm(i,1),w);
        
            x2 = min(longueur*tand(angle)/2-1 + Ym(i,1),h);
            y2 = min(longueur/2 +Xm(i,1)-1,w);
            line([x1,x2],[y1,y2]);
        
            [correct,chiffre_tot] = lancer_aleatoire(imgY,N,[y1,y2],[x1,x2]);
        end
        
    end
    
end










