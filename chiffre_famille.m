function [chiffre] =chiffre_famille(famille)
S=['AAAAAA','AABABB','AABBAB','AABBBA','ABAABB','ABBAAB','ABBBAA','ABABAB','ABABBA','ABBABA'];
   for i=1:10
      if( strcmpi(S(i),famille)==1  )
         chiffre=i;
      end
      
   end
end
