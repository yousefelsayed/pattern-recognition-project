function [contrast] = Contrast (glcm01,glcm10,glcm11)

val01 = 0;
val10 = 0;
val11 = 0;

for i= 1 : 6
   for j = 1 : 6
       val01 = val01 +( (i - j) * (i - j)* glcm01(i,j));
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i= 1 : 6
   for j = 1 : 6
       val10 = val10 +( (i - j) * (i - j)* glcm10(i,j));
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i= 1 : 6
   for j = 1 : 6
       val11 = val11 +( (i - j) * (i - j)* glcm11(i,j));
   end
end

contrast = (val01+val10+val11)/3;
end