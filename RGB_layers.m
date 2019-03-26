%Expeiment 1: RGB_Layers

clc; clear; close all;

rgb_img = imread('lena.jpg');

% Extracting color channels
redCh = rgb_img(:,:,1);
greenCh = rgb_img(:,:,2);
blueCh = rgb_img(:,:,3);

% Create a black channel.
allBlack = zeros(size(rgb_img, 1), size(rgb_img, 2), 'uint8');

red = cat(3, redCh, allBlack, allBlack);
green = cat(3, allBlack, greenCh, allBlack);
blue = cat(3, allBlack, allBlack, blueCh);

subplot(2, 2, 1);
imshow(rgb_img);
title('Original RGB Img');

subplot(2, 2, 2);
imshow(red);
title('Red Channel');

subplot(2, 2, 3);
imshow(green)
title('Green Channel');

subplot(2, 2, 4);
imshow(blue);
title('Blue Channel');