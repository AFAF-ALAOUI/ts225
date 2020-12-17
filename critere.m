function [crit,indice] = critere(H,N)
    max = 0;
    indice = 1;
    crit = zeros(1,N-1);
    for k=1:N-1
        crit(1,k) =omega(H,k,N)*(mu(H,N-1,N)-mu(H,k,N))^2+(1-omega(H,k,N))*mu(H,k,N)^2;
        if crit(1,k) > max
            max = crit;
            indice = k;
        end
    end
end