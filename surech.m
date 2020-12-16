function ech = surech(sth,u)
    ech = zeros(1,7*u);
    for i=1:7
        if sth(i)=='B'
            ech(u*(i-1)+1:u*(i-1)+u)= ones(1,u);
        end
    end
end