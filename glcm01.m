function R = glcm01( image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[H ,W, ~]=size(image);
R1 = uint8(zeros(H,W));
image=rgb2gray(image);
for i=1:H
    for j=1:W
        %r=double(image(i,j));
        g=double(image(i,j))/255;
        R1(i,j)=uint8(g*5);
    end
end

R2=double(zeros(6,6));
for i=1:H
    for j=1:W
        if(i>H-1)
            break;
        end
        
        R2(R1(i,j)+1,R1(i+1,j)+1) = R2(R1(i,j)+1,R1(i+1,j)+1) + 1;
        
    end
end
R=R2+transpose(R2);
R_sum=sum(sum(R,2));
for i=1:6
    for j=1:6
        R(i,j)=R(i,j)/R_sum;      
    end
end
end


