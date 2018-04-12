function [norm_glcm] = NormGLCM(GImg)

%Symmetrical Matrix
glcm = graycomatrix(GImg,'Offset',[0 1],'NumLevels', 6, 'Symmetric', true);


%Summation of all elements
s = sum(sum(glcm));

%Normalized Symmetrical Matrix
glcm = glcm / s;

norm_glcm = glcm;
end