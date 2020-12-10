function H = pond_omega(sigmaT)

    P = -3*floor(sigmaT):3*floor(sigmaT)+1;
    
    [X,Y] = meshgrid(P);
    H = 1/(2*pi*sigmaT^2).*exp(-(X.^2+Y.^2)/(2*sigmaT^2));
  
end