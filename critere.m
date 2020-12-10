function indice = critere(H,N)
    max = 0;
    indice = 0;
    for k=1:N-1
        crit =omega(H,k,N)*(mu(H,N-1,N)-mu(H,k,N))^2+(1-omega(H,k,N))*mu(H,k,N)^2;
        if crit > max
            max = crit;
            indice = k;
        end
    end
end