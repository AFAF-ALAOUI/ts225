function H = pond_omega(sigmaT)
    P = floor(-3*sigmaT):floor(3*sigmaT)+1;    
    [X,Y] = meshgrid(P);
    H = exp(-(X.^2+Y.^2)/(2*sigmaT^2))/(2*pi*sigmaT^2);
end