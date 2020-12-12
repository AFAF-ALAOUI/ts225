function [chiffre_code] =search_struct(chaine)
chiffre_code=0;
S = struct('A',{'BBBNNBN' ; 'BBNNBBN' ; 'BBNBBNN' ; 'BNNNNBN' ;'BNBBBNN'; 'BNNBBBN';'BNBNNNN';'BNNNBNN';'BNNBNNN';'BBBNBNN'}, ...
            'chiffre',{0 ; 1 ; 2 ; 3 ; 4 ; 5 ; 6 ; 7 ; 8 ; 9}, ...
            'B',{'BNBBNNN' ; 'BNNBBNN' ; 'BBNNBNN' ; 'BNBBBBN' ; 'BBNNNBN';'BNNNBBN';'BBBBNBN';'BBNBBBN';'BBBNBBN';'BBNBNNN'}, ...
            'C',{'NNNBBNB' ; 'NNBBNNB' ; 'NNBNNBB' ; 'NBBBBNB' ; 'NBNNNBB';'NBBNNNB';'NBNBBBB';'NBBBNBB';'NBBNBBB';'NNNBNBB' });

for i=1:length(S)
   if(strcmpi(S(i).A,chaine)==1 | strcmpi(S(i).B,chaine)==1 |  strcmpi(S(i).C,chaine)==1)
       chiffre_code=i;
     
     end
end
   

    
  
end