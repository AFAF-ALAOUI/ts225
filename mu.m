function u = mu(H,k,N)
    x = 1:k+1;
    u = sum(x.*H(1:k+1))/sum(H(1:N));

end