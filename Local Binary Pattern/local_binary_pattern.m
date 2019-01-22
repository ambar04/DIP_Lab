clc; clear; close all;

img = imread('lena.jpg');
subplot(2,2,1);
imshow(img);
title('Original Image');

proc = rgb2gray(img);
subplot(2,2,2);
imshow(proc);
title('Grayscale Image');

img_d = double(proc);
weight = zeros(3);

% padding the image
row_pad = zeros(1,size(img,1));
col_pad = zeros(size(img,2)+2,1);
row_padi = [row_pad;img_d;row_pad];
padi = [col_pad,row_padi,col_pad];
subplot(2,2,3);
imshow(uint8(padi));
title('Padded Image');

result = zeros(size(padi));
 
% determining the weights of each pixel in image
for i = 2 : size(padi,1)-1
    for j = 2 : size(padi,2)-1
        if padi(i,j)>padi(i,j+1)
            weight(2,3)=1;
        else
            weight(2,3)=0;
        end
        
        if padi(i,j)>padi(i-1,j+1)
            weight(1,3)=2;
        else
            weight(1,3)=0;
        end
        
        if padi(i,j)>padi(i-1,j)
            weight(1,2)=4;
        else
            weight(1,2)=0;
        end
        
        if padi(i,j)>padi(i-1,j-1)
            weight(1,1)=8;
        else
            weight(1,1)=0;
        end
        
        if padi(i,j)>padi(i,j-1)
            weight(2,1)=16;
        else
            weight(2,1)=0;
        end
        
        if padi(i,j)>padi(i+1,j-1)
            weight(3,1)=32;
        else
            weight(3,1)=0;
        end
        
        if padi(i,j)>padi(i+1,j)
            weight(3,2)=64;
        else
            weight(3,2)=0;
        end
        
        if padi(i,j)>padi(i+1,j+1)
            weight(3,3)=128;
        else
            weight(3,3)=0;
        end
        
        % summing the weights of neighbour pixels and adding them up
        new_value = sum(sum(weight));
        %replace the value in new image
        result(i,j) = new_value;
    end
end

subplot(2,2,4);
result = uint8(result);
imshow(result);
title('Local Binary Pattern')