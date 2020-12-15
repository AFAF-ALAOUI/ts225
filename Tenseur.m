function T = Tenseur(omega,Ia,Ib)
    T = conv2(Ia.*Ib,omega,'same');  
end