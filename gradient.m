function [Ix,Iy] = gradient(img,sigmaG)

%filtre de Canny
P = -3*round(sigmaG)-1:3*round(sigmaG)+1;
[X,Y] = meshgrid(P);
Gx = -X/(2*pi*sigmaG^4).*exp(-(X.^2+Y.^2)/(2*sigmaG^2));
Gy = Gx';

Ix = conv2(img,Gx,'same');
Iy = conv2(img,Gy,'same');

In = sqrt(Ix.^2+Iy.^2);
Ix = Ix./In;
Iy = Iy./In;

end