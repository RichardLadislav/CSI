function [outputArg1,outputArg2] = cannyED(image)
%cannyED Funkce implemetnuje Canny algoritmus pro detekci hran v obrazcich
%   
% Algoritmus probiha v peti krocich:
% 
%   ------------1. Smoothing for noise removal----------------------------
%   ------------2. Finding Gradients--------------------------------------
%   ------------3. None-maximum supperssion-------------------------------
%   ------------4. Double Tresholding-------------------------------------
%   ------------5. Edge Tracking by hysteresis----------------------------
% 
%   image - vstupem funkce je matice hodnot predstavujici obrazek nacteni
%   pomoci funkce imread();


image_grey = rgb2gray(image);


%% ----------------------1.Smoothing-------------------------------------
%smoothing cernel - 5x5 gaussian kernel with delta = 1.4
smooth_kernel = 1/(159*255) * [2 4 5 4 2; 4 9 12 9 4; 5 12 15 12 5; 4 9 12 9 4; 2 4 5 4 2]; 
image_smooth = conv2(image_grey,smooth_kernel);

%% ----------------------2.Finding gradients------------------------------
sobel_vertical = [1 0 -1; 2 0 -2; 1 0 -1];
sobel_horizontal = [ 1 2 1; 0 0 0; -1 -2 -1];

image_sobel_vertical = conv2(image_smooth,sobel_vertical);
image_sobel_horizontal = conv2(image_smooth,sobel_horizontal);
image_grad = sqrt(image_sobel_horizontal.^2+image_sobel_vertical.^2);

%% ----------------------3. None-maximum supperssion----------------------
 [x,y] = size(image_grad);

% for i = 1:x
    % for j = 1:y
        % r =image_grad(i,j);
% 
        % if r < max(image_grad)
            % image_nonmax(i,j) = 0;

        % elseif r >= max(image_grad)
            % image_nonmax(i,j) = max(image_grad);

        % end
    % end
% end
imag_nonmax = image_grad;
max_val = max(max(image_grad));

for i = 1:x
    for j = 1:y

        if max_val > imag_nonmax(i,j)
         
            imag_nonmax(i,j) =  max_val;

        elseif max_val <= imag_nonmax(i,j)

            imag_nonmax(i,j) = 0;
        end


    end
end


figure
imshow(imag_nonmax)





end