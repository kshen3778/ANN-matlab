
load('assign3v6.mat');

file = input('Enter file name: ', 's');
%load image
img = imread([file, '.jpg']);

imshow(img)

%V = img(155:609,130:501,:);
%V = img(8:47,12:31,:);
V = cropimg(img, 128);
imshow(V)

%convert to grayscale
RGB = rgb2gray(V);
imshow(RGB);

R = imgtovect(RGB);

imshow(vecttoimage(R));
%R = R'; %row vector

%train on training data
[percenterror, W_1, W_2] = runANN(12,0.0015,600);

%test on loaded image
TEST = R;
[neg_loglike,output_y, dE_dw1, dE_dw2] = function_e(TEST, testtargets(1,:), 12, W_1, W_2);
output_y = output_y';

%display recognized number
[confidence, index] = max(output_y);
if(index == 10)
   index = 0; %0 at 10th index 
end

disp(['Your number is: ', num2str(index)]); %display number

