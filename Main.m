%% Read Dataset
input_directory = 'D:\Fcis\Fourth Year\Pattern Recognition\Project'; %e.g. 'D:\faces'
filenames = dir(fullfile(input_directory, '*.jpg'));

num_images = length(filenames); %number of images found in selected folder
image_dims = [50, 50]; %set the desired dimensions of each image

%Initialize a Dataset to save all detected faces after preprocessing the images 
images = zeros(prod(image_dims), num_images);

all_features = [3,12];
%Loop on all images to crop faces
for i = 1:num_images
    %Build File Name 
    filename = fullfile(input_directory, filenames(i).name);
    
    %Read Colored Image of 'filename'
    image = imread(filename);
    
    features = feature_extraction(image, filenames(i).name);
    for j = 1 : 12
    all_features(i,j) = features(j);
   
    end
%     all_features(i,13)=filenames(i).name;

    fid = fopen('Matrix.txt', 'wt');
    fprintf(fid, [repmat('%g\t', 1, size(all_features,2)-1) '%g\n'], all_features.');
    fclose(fid)
end