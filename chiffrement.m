function [chiffre_barre] = chiffrement(I_code)

a=1;
b=7;

chiffre_barre=[];
for i=1:6
    I=I_code(:,a:b);
    chiffre_barre=[chiffre_barre search_struct(I)]; 
    a=a+7;
    b=b+7;
   
end


end
