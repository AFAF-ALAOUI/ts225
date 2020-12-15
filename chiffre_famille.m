function [chiffre] =chiffre_famille(famille)
chiffre=0;
S=["AAAAAA","AABABB","AABBAB","AABBBA","ABAABB","ABBAAB","ABBBAA","ABABAB","ABABBA","ABBABA"];
   for i=1:10
      if( strcmpi(S(i),famille)==1  )
         chiffre=i-1;
         break;
      end
      
   end
end