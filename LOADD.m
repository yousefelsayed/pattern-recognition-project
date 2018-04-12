function [Training] = LOADD()
row=0;
row = int32(row);

RunLength=zeros(1,12);
Dir = 'D:\Fcis\Fourth Year\Pattern Recognition\Project\Data set\Training'; 
%Dir = strcat(Dir,num2str(j));
Dir = strcat(Dir,'\');
FName=fullfile(Dir);
pth=genpath(Dir);
pathee = regexp([pth ';'], '(.*?);','tokens');
for j = 2 : length(pathee)-1
srcFiles=dir([pathee{1,j}{:} '\*.jpg']);
for i = 1 : length(srcFiles)
    
    Dir =pathee{1,j};
    Dir = strcat(Dir,'\');
    filename = strcat(Dir,srcFiles(i).name);
   stre=filename(1);
   cattr = imread(stre{1,1});
   whos cattr
    Fet=RunLength(cattr);
    Fet=[Fet j-1];
    RunLength=[RunLength;Fet];
    row=row+1;
end
end
Training (1,:)=[] ;
RunLength (1,:)=[] ;
csvwrite('RunlengthTraining.csv',RunLength);







