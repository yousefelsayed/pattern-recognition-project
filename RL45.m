function [ p45 ] = RL45( img )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

img = padarray(img,[1 1]);
[H W] =size(img);

p45 = zeros(8,99);
i=H-1;
while i >= 2
    j=W-1;
    counter=0;
    while j >= 2
        if(img(i,j) ~= -1) 
       if(i==2)
           val=img(i,j);
           p45(mod(val,8)+1,1)=p45(mod(val,8)+1,1)+1;
           img(i,j) = -1;
       else
       if(j+1<=W && (img(i,j) ~= img(i-1,j+1)))
           counter=counter+1;
           val=img(i,j);
           p45(mod(val,8)+1,mod(counter,99))=p45(mod(val,8)+1,mod(counter,99))+1;
           img(i,j) = -1;
           counter=0;
       else
           jj = j;
           ii = i ;
           val=img(i,j);
           while jj+2<=W && ii > 1 && (img(ii,jj) == img(ii-1,jj+1))
               counter=counter+1;
               img(ii,jj) = -1;
               
               jj=jj+1;
               ii=ii-1;
           end
           img(ii,jj) = -1;
            counter=counter+1;
            
            
            p45(mod(val,8)+1,mod(counter,99))=p45(mod(val,8)+1,mod(counter,99))+1;
            counter=0;
          
       end
        
       end
       
        end
        j=j-1;
    end
    i=i-1;
end
p45

end

