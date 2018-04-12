function [glcm_entropy] = GLCM_Entropy(glcm01,glcm10,glcm11)
val01 = 0;
val10 = 0;
val11 = 0;
for i= 1 : 6
   for j = 1 : 6
        if(glcm01(i,j)~=0)
       val01 = val01 + (glcm01(i,j)* log2(glcm01(i,j)));
        end
   end
end

%%%%%%%%%%%%
for i= 1 : 6
   for j = 1 : 6
       if(glcm10(i,j)~=0)
       val10 = val10 + (glcm10(i,j)* log2(glcm10(i,j)));
       end
   end
end
%%%%%%%%%%%%%
for i= 1 : 6
   for j = 1 : 6
       if(glcm11(i,j)~=0)
       val11 = val11 + (glcm11(i,j)* log2(glcm11(i,j)));
       end
   end
end

glcm_entropy = (-1 *(val01+val10+val11)/3);

end