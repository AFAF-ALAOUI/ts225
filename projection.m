function project=projection(x,y,V)
    project = zeros(length(x),1);
    for i=1:length(x)
        project(i,1) = x(i)*V(1)+ y(i)*V(2);
    end
end