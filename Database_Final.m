%% Below Coding Section by Mac and Maia

function pictures = load_database();  %% creates function to load pictures into database

persistent loaded; %% creates a persistent variable 'loaded'
persistent numeric_image; %% creates a persistent variable 'numeric image'

if(isempty(loaded)) %% if statement that executes following command if variable loaded is 0
    all_Images = zeros(82369, 8); %% sets size of matrix that will be a string of the images with 82,369 pixels each (287 x 287)
    cd('Pictures'); %% goes to Pictures folder where pictures are located
    for ii = 1:4 %% for statement to run for the 4 individual folders
        cd(strcat('P',num2str(ii))); %% opens individual folders P1 to P4 using steps from 1:4
        for jj = 1:2 %% for statement to execute following command for both images per individual
            image_contain = imread(strcat(num2str(jj), '.jpg')); %% opens images in each folder until 1.jpg and 2.jpg are open
            all_images(:,(ii-1)*2+jj) = reshape(image_contain, size(image_contain,1)*size(image_contain,2),1); %% creates matrix of all images in numerical form stacked on top of each other
        end %% ends for loop for each picture within the individual folders per person
        disp('Pictures Loading'); %% Displays Pictures Loading for each set of Pictures
        cd .. %% goes to previous folder which is 'Project 1'
    end %% ends original for loop for each folder per person
    numeric_image = uint8(all_images); %% converts the numeric image variable into an unsigned 8-bit integer version of all of the images
end %% ends if statement loop
loaded = 1; %% sets loaded variable equal to 1 
pictures = numeric_image; %% sets output variable equal to the 
end %% ends the function

%% End of Coding by Mac and Maia -- Research, Coding, and DeBugging took 20 Hours
%% Research and Coding done by Maia -- took 15 hours; Debugging by Mac -- took 5 hours
%% This Time Includes -- Acquiring Pictures, Formatting and Editing Pictures, Arranging Folders of Pictures, and Uploading Pictures to be implemented into Database for Code