function [homogeneity] = Homogeneity (glcm01,glcm10,glcm11)


val01 = 0;
val10= 0;
val11 = 0;
for i= 1 : 6
   for j = 1 : 6
       val01 = double(val01) +(glcm01(i,j) / double( (1 + abs(double(i - j)) ) ));
   end
end
%%%%%%%%%%%%%%%%%%%%%
for i= 1 : 6
   for j = 1 : 6
       val10 = double(val10) +(glcm10(i,j) / double( (1 + abs(double(i - j)) ) ));
   end
end
%%%%%%%%%%%%%%%%%%%%%
for i= 1 : 6
   for j = 1 : 6
       val11 = double(val11) +(glcm11(i,j) / double( (1 + abs(double(i - j)) ) ));
   end
end

homogeneity = (val01+val11+val10)/3;
end