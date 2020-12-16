function [chiffre_barre,famille_barre] = chiffrement(I_code,u)
    S = struct('A',{'BBBNNBN' ; 'BBNNBBN' ; 'BBNBBNN' ; 'BNNNNBN' ;'BNBBBNN'; 'BNNBBBN';'BNBNNNN';'BNNNBNN';'BNNBNNN';'BBBNBNN'}, ...
            'B',{'BNBBNNN' ; 'BNNBBNN' ; 'BBNNBNN' ; 'BNBBBBN' ; 'BBNNNBN';'BNNNBBN';'BBBBNBN';'BBNBBBN';'BBBNBBN';'BBNBNNN'}, ...
            'C',{'NNNBBNB' ; 'NNBBNNB' ; 'NNBNNBB' ; 'NBBBBNB' ; 'NBNNNBB';'NBBNNNB';'NBNBBBB';'NBBBNBB';'NBBNBBB';'NNNBNBB' });

    chiffre_barre=zeros(1,12);
    famille_barre = 'AAAAAAAAAAAA';
    for k=1:12
        diff= Inf;
        I=I_code(7*(k-1)*u+1:7*(u+(k-1)*u));
        for i=1:length(S)
            if(diff  > sum((surech(S(i).A,u)-I).^2))
                diff =  sum((surech(S(i).A,u)-I).^2);
                chiffre_barre(1,k)= i-1;
                famille_barre(1,k) = 'A';
            end
            if(diff  > sum((surech(S(i).B,u)-I).^2))
                diff =  sum((surech(S(i).B,u)-I).^2);
                chiffre_barre(1,k)= i-1;
                famille_barre(1,k) = 'B';
            end
            if(diff  > sum((surech(S(i).C,u)-I).^2))
                diff =  sum((surech(S(i).C,u)-I).^2);
                chiffre_barre(1,k)= i-1;
                famille_barre(1,k) = 'C';
            end
            if (diff==0)
                break;
            end
        end    
    end
end