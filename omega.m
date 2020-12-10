function w = omega(H,k,N)
    w = sum(H(1:k+1))/ sum(H(1:N));
end