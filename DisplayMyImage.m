function []=DisplayMyImage(Image)
Image=Image-min(min(Image));
figure;
imshow(uint8(255*Image/max(max(abs(Image)))));