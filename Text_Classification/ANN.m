
load('assign3v6.mat');

file = input('Enter file name: ', 's');
%load image
img = imread([file, '.jpg']);

V = cropimg(img);

%convert to grayscale
g = rgb2gray(V);
%imshow(RGB);

R = imgtovect(g);

%R = R'; %row vector
figure;
imshow(vecttoimage(R));

%train on training data
[percenterror, W_1, W_2] = runANN(250,0.001574,3000);

%test on loaded image
TEST = R;
[neg_loglike,output_y, dE_dw1, dE_dw2] = function_e(TEST, testtargets(1,:), 250, W_1, W_2);
output_y = output_y';

%display recognized number
[confidence, index] = max(output_y);
if(index == 10)
   index = 0; %0 at 10th index 
end

disp(['Your number is: ', num2str(index)]); %display number

