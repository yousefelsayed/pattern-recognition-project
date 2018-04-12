function [features] = feature_extraction (img)
Glcm01 = glcm01(img);
Glcm10 = glcm10(img);
Glcm11 = glcm11(img);
% 9
contrast = Contrast(Glcm01,Glcm10,Glcm11);
% 10
glcm_entropy = GLCM_Entropy(Glcm01,Glcm10,Glcm11);
% 11
energy = Energy (Glcm01,Glcm10,Glcm11);
% 12 
homogeneity = Homogeneity (Glcm01,Glcm10,Glcm11);
features(1,1)=glcm_entropy;
features(1,2)=energy;
features(1,3)=homogeneity;
features(1,4)=contrast;
% features(1,13)=filename;

features=[glcm_entropy energy homogeneity contrast];
end





