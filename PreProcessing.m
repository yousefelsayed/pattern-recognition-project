function [ OutImg ] = PreProcessing( InImg )
Gimg=rgb2gray(InImg);
Bw=bwlabel(I);
% r=regionprops(Bw,'all');
% for i=1 : length(r)
% imshow(r(i).Image);
% end
% 
% end


