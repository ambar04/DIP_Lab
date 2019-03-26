%Experiment 5: Watermarking
clc; close all; clear;

I_original = imread('shah.jpg');
I_gray = rgb2gray(I_original);
Im=double(I_gray);

wname = 'sym4';
[cA,cH,cV,cD] = dwt2(Im,wname);

Signature_color = imread('sig.jpg');
Signature_gray= rgb2gray(Signature_color);
Sig=double(Signature_gray);

for i=1:228
    for j=1:303
        sig_new(i,j)=Sig(i,j);
    end
end

sig_new_gray=uint8(sig_new);

figure(1);
subplot(2,3,1);
imshow(I_gray);
title('Original image');

subplot(2,3,2);
imshow(sig_new_gray);
title('Signature');

subplot(2,3,3);
imshow(cA);
title('cA');

subplot(2,3,4);
imshow(cH);
title('cH');

subplot(2,3,5);
imshow(cV);
title('cV');

subplot(2,3,6);
imshow(cD);
title('cD');

figure(2)
water_Im = idwt2(cA,sig_new,sig_new,cD,wname);
wat_im=uint8(water_Im);
imshow(wat_im);
title('Water mark image');

%reconstruction of image

[cA_water,cH_water,cV_water,cD_water] = dwt2(water_Im,wname);
figure(3);
Rec_sig=uint8(cH_water);
subplot(1,2,1);
imshow(Rec_sig);
title('Reconstructed signature');

Rec_Im = idwt2(cA_water,cH,cV,cD_water,wname);
Rec=uint8(Rec_Im);
subplot(1,2,2);
imshow(Rec);
title('Reconstructed image');