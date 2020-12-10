function T_ab = Tenseur(omega,x,y,Ia,Ib)

    T_ab = conv2(omega,Ia(x,y).*Ib(x,y));
     
end