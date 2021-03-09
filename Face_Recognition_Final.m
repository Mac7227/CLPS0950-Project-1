%% This is a game that allows the user to guess who the randomly indexed image is of
%% then goes through the rest of the data set of pictures and finds the most similar image.
%% After it finds the most similar image, it assesses that image and provides the correct answer
%% of who the image is of.

%% Below Coded by Mac -- Line 2 through Line 22

loaded_image = Database_Final (); %% sets loaded image equal to the uploaded database


random_index = round(7*rand(1)+1); %% creates variable that pulls random numbers from 1 to 8
random_image = loaded_image(:,random_index); %% pulls associated image from set of images based on random index value
rest_of_the_images = loaded_image(:,([1:random_index-1 random_index+1:end])); %% sets of rest images equal to the entire set of images except the random indexed image

white_image = uint8(ones(1, size(rest_of_the_images,2))); %% creates an 8-bit integer string of ones for each of the rest of the images
mean_value = uint8(mean(rest_of_the_images,2)); %% calculates the mean of the rest of the images using 8-bit integers
mean_removed = rest_of_the_images - uint8(single(mean_value)*single(white_image)); %% removes the mean values of the rest of the images from the set of the rest of the images

L = single(mean_removed)'*single(mean_removed); %% creates a 7 x 7 matrix of the product of mean removed and transpose of mean removed variables
[V,D] = eig(L); %% creates diagonal matrix of eigenvalues and a full matrix of the eigenvectors for L
V = single(mean_removed)*V; %% sets V equal to the full matrix of eigenvectors times the single precision values of mean removed
V = V(:, end:-1:end); %% sets V equal to a column vector of the values calculated above

all_image_signature = zeros(size(rest_of_the_images, 2), 1); %% sets all image signature equal to column vector of 7 zeros
for ii = 1:size(rest_of_the_images,2);     %% creates loop from 1 to 7 (number of rows of the rest of the images variable)
    tmp_var = single(mean_removed(:,ii)'); %% creates variable equal to a single row of single precision values of the mean removed variable for the rest of the images
    all_image_signature(ii,:) = tmp_var*V; %% creates column vector of the 7 values for each other rest of the images calculated from above
end %% ends for loop that creates the column of values for the rest of the images to be compared to the indexed image

%% End of Mac's Coding Section -- Research, Coding, and DeBugging took 20 Hours
%% Debugging by Neil for 10 hours

%% Below Coded by Neil -- Line 34 - 47

subplot(121); %% sets location of image below
imshow(reshape(random_image,287,287)); %% presents the randomly indexed picture to the above location and sets size
Guess = ['Guess:',' ', input('Guess Who this is? ', 's')]; %% sets variable to ask the user who they think the randomly indexed image is
title(Guess, 'FontWeight', 'bold', 'Fontsize', 16, 'color', 'black'); %% sets title to answer from user and makes the title look nice

subplot(122); %% sets location of image below to the right of the image above
p = random_image - mean_value; %% sets p to equal the difference of values in a column vector of indexed image and mean value
s = single(p)'*V; %% multiplies the single precision value of p by the column vector V from before
format long g; %% sets format of numbers going forward to long in prep for assigning correct answers below
z = []; %% creates empty matrix variable z
for ii = 1:size(rest_of_the_images,2); %% sets for loop from 1 to 7 (number of rows of the rest of the images variable)
    z = [z,norm(all_image_signature(ii, :) - s, 2)]; %% creates 1 by 7 row vector for the difference between s and the all image signature values
    drawnow; %% updates the figure in the subplot
end

%% End of Neil's Coding Section -- Research, Coding, and Debugging took 15 hours 


Title = ' ' %% Creates variable Title to use for the title of the right side subplot
if z == [450195808   400222880    91482416    95078072    37283160    29946568    27731112] %% values for z associated with images of Maia
    Title = 'Answer: Maia' %% if it is an image of Maia, change title of subplot to Answer: Maia
elseif z == [72766848   501024640   501520704   435545184   411867968   422296864   446844160] %% values for z associated with images of Mac
    Title = 'Answer: Mac' %% if it is an image of Mac, change title of subplot to Answer: Mac
elseif z == [468156864   416850624    83487584    88209184    16191648    34421992    50217856] %% values for z associated with images of Alli
    Title = 'Answer: Alli' %% if it is an image of Alli, change title of subplot to Answer: Alli
elseif z == [471238432   416774208    96856664    99641368    35209552    43700248    60755792] %% values for z associated with images of Alli
    Title = 'Answer: Alli' %% if it is an image of Alli, change title of subplot to Answer: Alli
elseif z == [565344   510235424   510683904   442936256   430861280   432254400   454206752] %% values for z associated with images of Mac
    Title = 'Answer: Mac' %% if it is an image of Mac, change title of subplot to Answer: Mac
elseif z == [460469248   413074368    67990864    71935480    14551804     9388728    11828560] %% values for z associated with images of Alli
    Title = 'Answer: Alli' %% if it is an image of Alli, change title of subplot to Answer: Alli
else %% all other values contributed to Jarred's images
    Title = 'Answer: Jarred' %% if it is an image of Maia, change title of subplot to Answer: Jarred
end %% ends the if statements

[a,ii] = min(z); %% sets vector equal to the minimum z and the associated image with the minimum z
subplot(122); %% sets subplot position
imshow(reshape(rest_of_the_images(:,ii), 287, 287)); %% shows associated image of the minimum z value
title(Title, 'FontWeight', 'bold', 'Fontsize', 16, 'color', 'black'); %% changes Title to correct answer name and makes it look nice


    
