clear all;
clc;

%%% Reading the Initial Image
I = imread('cameraman.png');
row = size(I,1);
col = size(I,2);

%%% Generating histogram of the Initial Image
hist_of_ini = zeros(1,256);
for i=1:row
    for j=1:col
        hist_of_ini(I(i,j))= hist_of_ini(I(i,j))+1;
    end
end

%%% Showing the image and graph
subplot(2,2,1);
imshow(I);
title('Original Image');
subplot(2,2,2);
bar(hist_of_ini);
title('Histogram of Original Image');

%%% Calculating the PDF
pdf =zeros(1,256);
for i=1:256
    for j=1:256
        pdf(I(i,j))= pdf(I(i,j))+1;
    end
end

pdf1 = pdf/(row*col);

%%% Calculating the CDF
cdf = zeros(1,256);
cdf(1) = pdf1(1);
for i=2:256
    cdf(i)= pdf1(i) + cdf(i-1);
end

%%% Multiplying the CDF by L-1
cdf_l = zeros(1,256);
for i=1:256
    cdf_l(i)= round(cdf(i)*255);
end

new_img = I;
%%% Generating the New image
for i = 1:row
    for j = 1:col
        new_img(i,j) = cdf_l(new_img(i,j) + 1);
    end
end

%%% Generating histogram of the New Image
hist_of_new = zeros(1,256);
for i=1:row
    for j=1:col
        hist_of_new(new_img(i,j))= hist_of_new(new_img(i,j))+1;
    end
end

%%% Showing the image and graph
subplot(2,2,3);
imshow(new_img);
title('Equalized Image');
subplot(2,2,4);
bar(hist_of_new);
title('Histogram of Equalized Image');