function [ p135 ] = RL135( img )

% B = img
B = transpose(img);
S=fliplr(B);
p135=RL45(S);
end

