function [segmentedimage] = Edgebased2(image,image2)
grayimage = rgb2gray(image);
BW = edge(grayimage,'canny');
BW = imdilate(BW,ones(5,5));
BW = ~BW;
[Labels no_objects] = bwlabel(BW);
segmentedimage = label2rgb(Labels);
% set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
[h w] = size(image);
smallRatio = h*w*0.0001;
for i=1:no_objects
    x = uint8(Labels==i);
    f = sum(sum(x==1));
     if(f < smallRatio) % to neglect small regions
         continue;
     end
    d = zeros(size(image));
    d(:,:,1) = uint8(x).*image(:,:,1);
    d(:,:,2) = uint8(x).*image(:,:,2);
    d(:,:,3) = uint8(x).*image(:,:,3);
   d = im2bw(d);
  figure , imshow (d);

%       seg = bwareafilt (d,1) ;
    
%  final=bwareaopen(seg,200);    
    
    
    
    [ul_corner]=regionprops(d,'BoundingBox');
       SEG = imcrop(image2,[ul_corner.BoundingBox(1,1),  ul_corner.BoundingBox(1,2), ul_corner.BoundingBox(1,3) , ul_corner.BoundingBox(1,4)]);
imshow(SEG);
    figure , imshow (SEG);
    % save_img(SEG,no_objects);
imwrite(SEG,sprintf('image%d.jpg',i));
end

end
