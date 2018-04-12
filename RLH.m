function [p0] = RLH( img )
%img=rgb2gray(img);

img = padarray(img,[1 1]);
[H W] =size(img);
p0 = zeros(8,99);
i=2;
while i <= H-1
    j=2;
    counter=0;
    while j <= W-1        
       if(j+1<=W && (img(i,j) ~= img(i,j+1)))
           counter=counter+1;
           val=img(i,j);
           p0(mod(val,8)+1,mod(counter,99))=p0(mod(val,8)+1,mod(counter,99))+1;
           counter=0;
       else
          
           while j+2<=W && (img(i,j) == img(i,j+1))
               
               counter=counter+1;
               j=j+1;
           end
            counter=counter+1;
            val=img(i,j);
            p0(mod(val,8)+1,mod(counter,99))=p0(mod(val,8)+1,mod(counter,99))+1;
            counter=0;
          
       end
        j=j+1;
    end
    i=i+1;
end

end

