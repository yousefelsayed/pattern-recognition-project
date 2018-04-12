function [s] = svm()
i=1;
while i<5
    data=csvread('Training.csv',(i-1)*5,0,[(i-1)*5,0,(i*5-1)+5,3]);
    label=csvread('Training.csv',(i-1)*5,4,[(i-1)*5,4,(i*5-1)+5,4]);
    TestingData=csvread('Training.csv',0,0,[0,0,24,3]);
    svmStruct = svmtrain (data, label, 'kernel_function', 'rbf', 'showplot', true);
    classes = svmclassify(svmStruct,TestingData,'showplot',true);
    i=i+1;
end

end

