clear all;
clc;
%%% taking Input RGB image and Converting to Grayscale
rgb = imread('peppers_color.jpg');
subplot(2,5,1);
imshow(rgb);
title('Original Image');

grey = rgb2gray(rgb);
subplot(2,5,2);
imshow(grey);
title('GrayScale Image');
[row,col] = size(grey);

%%% Getting the Value of the every bitwise column
change_to_d = double(grey);

mat1 = mod(change_to_d, 2);
mat2 = mod(floor(change_to_d/2), 2);
mat3 = mod(floor(change_to_d/4), 2);
mat4 = mod(floor(change_to_d/8), 2);
mat5 = mod(floor(change_to_d/16), 2);
mat6 = mod(floor(change_to_d/32), 2);
mat7 = mod(floor(change_to_d/64), 2);
mat8 = mod(floor(change_to_d/128), 2);

%%% Calculating the Bitwise Value and Showing the Images
for i=1:8
    k=i-1;
    X = power(2,k);
    NewImage = bitand(change_to_d,X);
    nam = strcat('Bitwise ',num2str(i));
    subplot(2,5,i+2);
    imshow(NewImage);
    title(nam);
end

