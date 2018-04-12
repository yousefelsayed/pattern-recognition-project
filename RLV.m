function [ p0 ] = RLV( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%img= mod(img,8);

%B = Transpose(img);
B = img.'
p0 = RLH(B);

end

