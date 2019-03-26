clc; clear; close all;

%Read Input Image

input_image = imread('lena.jpg');

% Two Dimensional Orthogonal Wavelet Transform
n=input('Enter the decomposition level: ');
[Lo_D,Hi_D,Lo_R,Hi_R] = orthfilt('haar');
[c,s]=wavedec2(input_image,n,Lo_D,Hi_D);

%Display Image
figure(1);
subplot(1,2,1);
imshow(input_image);
title('Input Image');

[thr,sorh,keepapp,crit] = ddencmp('cmp','wp',input_image); %Compressing and Wavelet-Packet
[compressed_image,wpt,perf0,perfl2] = wpdencmp(input_image,sorh,3,'haar',crit,thr,keepapp);
 
%Reconstruction 

 reconstructed_image1 = waverec2(c,s,'haar'); 
 reconstructed_image=uint8(reconstructed_image1);
 subplot(1,3,1);
 imshow(input_image);
 title('Input Image'); % Plot Input and Compressed Images 
 subplot(1,3,2);
  imshow(uint8(compressed_image));
title('Compressed Image');
 subplot(1,3,3);
 imshow(reconstructed_image);
 title('Reconstructed Image');
 
size(input_image);
 size(compressed_image);
 size(reconstructed_image);
 whos; % display size of image
 