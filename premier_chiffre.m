function [famille_ABC] =premier_chiffre(I_code)

    S = struct('A',{'BBBNNBN' ; 'BBNNBBN' ; 'BBNBBNN' ; 'BNNNNBN' ;'BNBBBNN'; 'BNNBBBN';'BNBNNNN';'BNNNBNN';'BNNBNNN';'BBBNBNN'}, ...
            'B',{'BNBBNNN' ; 'BNNBBNN' ; 'BBNNBNN' ; 'BNBBBBN' ; 'BBNNNBN';'BNNNBBN';'BBBBNBN';'BBNBBBN';'BBBNBBN';'BBNBNNN'}, ...
            'C',{'NNNBBNB' ; 'NNBBNNB' ; 'NNBNNBB' ; 'NBBBBNB' ; 'NBNNNBB';'NBBNNNB';'NBNBBBB';'NBBBNBB';'NBBNBBB';'NNNBNBB' });
    famille_ABC=[];
    a=1;
    b=7;

    for j=1:6
        j
        I=I_code(a:b)
        for i=1:10
            if(strcmpi(S(i).A,I)==1 )
                famille_ABC=[famille_ABC 'A']
            end
            if(strcmpi(S(i).B,I)==1  )
                famille_ABC=[famille_ABC 'B']
            end
            if( strcmpi(S(i).C,I)==1  )
                famille_ABC=[famille_ABC 'C']
            end
        end
   
        a=a+7;
        b=b+7; 
    end
end