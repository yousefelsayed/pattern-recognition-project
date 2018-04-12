function [Training] = LOADFeature()
row=0;
row = int32(row);
Training = zeros(1,5) ;
RunLengthM=zeros(1,12);
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

   I = imread(stre{1,1});
   whos cattr
    F = feature_extraction(I);
    Fet=RunLength(I);
    Fet=[Fet j-1];
    F = [F j-1];
    Training = [Training ; F];
    RunLengthM=[RunLengthM;Fet];
    row=row+1;
end
end
Training (1,:)=[] ;
csvwrite('Training.csv',Training);
csvwrite('RunlengthTraining.csv',RunLengthM);
end






