clc;
clear all;
close all;

%% nacitanie obrazkou
image_1 = imread("ou_yes.png");
image_2 = imread("fight_my_right_to_prahovani.jpg");
% vytvorenie listu obrazkou pre zobrazenie v jednom okne
image_list_RGB = {image_1 image_2}; 
% zobrazenie obrazkou
% figure("Name","Original images")
% montage(image_list_RGB)

%% prevedenie obrazkov z RGB na greyscale
smooth_kernel =  [2 4 5 4 2; 4 9 12 9 4; 5 12 15 12 5; 4 9 12 9 4; 2 4 5 4 2];
image_1_grey = rgb2gray(image_1);
image_2_grey = rgb2gray(image_2);
image_list_grey = {image_1_grey image_2_grey};
% figure("Name","Greyscale images")
% montage(image_list_grey)
%% vytvorenie matic pre hranove filtre 3x3 (Perwit operator)
% zeros_3x3 = zeros(3);
vertical_3x3 =  1/159*[1 0 -1; 1 0 -1; 1 0 -1];
horizontal_3x3 = [1 1 1; 0 0 0; -1 -1 -1]; 

image_1_horizontal_3x3 = conv2(image_1_grey,horizontal_3x3); 
image_2_vertical_3x3 = conv2(image_2_grey,vertical_3x3);
image_2_mix_3x3 = conv2(image_2_vertical_3x3,horizontal_3x3);

image_list_3x3 = {image_1_horizontal_3x3 image_2_vertical_3x3 image_2_mix_3x3};

 figure("Name","Filtred images by 3x3 filters")
montage(image_list_3x3);

cannyED(image_1)


