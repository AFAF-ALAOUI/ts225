function D_xy = coherence(w,i,j,Ix,Iy)
    D_xy= sqrt((Tenseur(w,i,j,Ix,Ix)-Tenseur(w,i,j,Iy,Iy))^2 + 4*Tenseur(w,i,j,Ix,Iy)^2)/(Tenseur(w,i,j,Ix,Ix)+Tenseur(w,i,j,Iy,Iy));    
end