function D_xy = coherence(w,x,y,Ix,Iy)

    D_xy= sqrt((Tenseur(w,x,y,Ix,Ix)-Tenseur(w,x,y,Iy,Iy))^2 + 4*Tenseur(w,x,y,Ix,Iy)^2)/(Tenseur(w,x,y,Ix,Ix)+Tenseur(w,x,y,Iy,Iy));
    
end