function [M] = RunLength( img )

img=rgb2gray(img);
Gimg= mod(img,8);
Gimg=double(Gimg);
p0=RLH(Gimg);
p45=RL45(Gimg);
p135=RL135(Gimg);
[ i j]=size(p);
p90=RLV(Gimg);
p = p0 + p45 + p90 + p135;
maximgS=99;
helo = sum(p,1);
np=sum(((1:maximgS).^2) .* helo);
totSum = sum(p(:));
helo = sum(p,1);
SRE = sum(helo ./ ((1:maximgS).^2))   / totSum;
LRE = sum(sum(p,1) .* ((1:maximgS).^2)) / totSum;
RLNU = sum(sum(p,1) .^2) / totSum;
RPC = totSum / np;
GLNU = sum(sum(p,1) .^2) / totSum;
LGRE = sum(sum(p,2) ./ ((1:8)'.^2)) / totSum;
HGRE = sum(sum(p,2) .* ((1:8)'.^2)) / totSum;
LRHGE=sum(sum(p) .* (i.^2).*(j.^2)) / totSum;
LRLGE=sum(sum(p) .* (i.^2)./(j.^2))/totSum;
SRLGE=sum(sum(p) ./ ((i.^2).*(j.^2))/totSum;
SRHGE=sum(sum(p) .* ((i.^2)./(j.^2))/totSum;
M=[SRE LRE RLNU RPC GLNU LGRE HGRE LRHGE LRLGE SRLGE SRHGE];

end

