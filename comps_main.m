%% Main Script
% Author: Hunter Woo Leong


%% Read & resize images

% AChEs Acetylcholinesterase histochemistry
stain = imread('ratstain.jpg');
%imshow(stain);

% Nissl stain
purple = imread('purple_stain.png');
%imshow(purple);

% Atlas
ratlas = imread("ratlas.jpg");
ratlas = imresize(ratlas, size(rgb2gray(stain)));
%imshow(ratlas);

%% Cropping original image 
% Focusing on specific parts of the stain & atlas

% Interactive image cropping tool
% 1. Click and drag cursor over you choice of stain section
% 2. Right click and select 'Crop Image' to save the cropped
%    image, dimensions, and coordinates where cropped
[cropped_stain,rect] = imcrop(stain);
cropped_atlas = imcrop(ratlas, rect);

% Visualize results
subplot(1,2,1);
imshow(cropped_stain);
subplot(1,2,2);
imshow(cropped_atlas);

% Confirm cropped images
stain = cropped_stain;
ratlas = cropped_atlas;


%% Get matching points
% n = number of points in one image
% minimum 4 points, maximum 8 points
n=4;
ratlas_pts = readPoints(ratlas, n);
ratlas_pts = ratlas_pts';

% stain pixel coordinates
stain_pts = readPoints(stain, n);
stain_pts = stain_pts';

%% Estimating and applying homography on atlas

transformed_atlas = homography(ratlas, ratlas_pts, stain, stain_pts);


%% Show overlay and readjust transparency level of atlas 
% Adjust alpha level to your prefence of transparency
% alpha level is any value 1 to 0
% 1 being completely non transparent
% 0 being completey transparent
alpha_level = 0.5;

% non-filtered overlay
overlay_atlas(transformed_atlas, stain, alpha_level)

% canny-filtered (edge detection filter) overlay
overlay_canny_atlas(transformed_atlas, stain, alpha_level)







