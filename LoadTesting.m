function [] = LoadTesting( )
Testing = zeros(1,4) ;
RunLengthM=zeros(1,11);
Dir = 'D:\Fcis\Fourth Year\Pattern Recognition\Project\Data set\Testing'; 
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

   I = imread(stre{1,1});
   whos cattr
    F = feature_extraction(I);
    Fet=RunLength(I);
    Fet=[Fet];
    F = [F];
    Testing = [Testing ; F];
    RunLengthM=[RunLengthM;Fet];
    
end
end
Testing (1,:)=[] ;
csvwrite('Testing.csv',Testing);
csvwrite('RunlengthTesting.csv',RunLengthM);
end

