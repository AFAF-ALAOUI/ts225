function [famille_ABC] =premier_chiffre(I_code)

S = struct('A',{'BBBNNBN' ; 'BBNNBBN' ; 'BBNBBNN' ; 'BNNNNBN' ;'BNBBBNN'; 'BNNBBBN';'BNBNNNN';'BNNNBNN';'BNNBNNN';'BBBNBNN'}, ...
            'B',{'BNBBNNN' ; 'BNNBBNN' ; 'BBNNBNN' ; 'BNBBBBN' ; 'BBNNNBN';'BNNNBBN';'BBBBNBN';'BBNBBBN';'BBBNBBN';'BBNBNNN'}, ...
            'C',{'NNNBBNB' ; 'NNBBNNB' ; 'NNBNNBB' ; 'NBBBBNB' ; 'NBNNNBB';'NBBNNNB';'NBNBBBB';'NBBBNBB';'NBBNBBB';'NNNBNBB' });
famille_ABC=[];
a=1;
b=7;

chiffre_barre=[];
for j=1:12
    I=I_code(:,a:b);
    
    disp(I);
    a=a+7;
    b=b+7;
   for i=3:8
   if(strcmpi(S(i).A,I)==1 )
       disp(S(i).A);
       famille_ABC=[famille_ABC 'A'];
   end
   if(strcmpi(S(i).B,I)==1  )
      famille_ABC=[famille_ABC 'B'];
      disp(S(i).B);
   end
    if( strcmpi(S(i).C,I)==1  )
      famille_ABC=[famille_ABC 'C'];
      disp(S(i).C);
   end

end
    
    
end

% S=['AAAAAA','AABABB','AABBAB','AABBBA','ABAABB','ABBAAB','ABBBAA','ABABAB','ABABBA','ABBABA'];
%    for i=1:10
%       if( strcmpi(S(i),chiffre_code)==1  )
%          chiffre=i;
%       end
%       
%    end
end
