clear all;
close all;
clc;

[input, pathname, filterindex] = uigetfile( ...j
{  '*.*','jpeg-files (*.*)'; }, ...
   'Pick an image', ...
   'MultiSelect', 'on');
I=imread(strcat(pathname,input));
level = graythresh(I);
BW = im2bw(I,level);

i=1;j=1;
if BW(i,j)==1
    BW=~BW;
end
imshow(BW)

cc = bwconncomp(BW);
labeled = labelmatrix(cc);
% RGB_label = label2rgb(labeled, @copper, 'c', 'shuffle');
% imshow(RGB_label,'InitialMagnification','fit')

for i=1:cc.NumObjects
    L=ismember(labeled,i);
    STATS = regionprops(L, 'Image');
    letter=STATS.Image;
    figure,imshow(letter);
end




