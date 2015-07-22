img = imread('digit9.jpg');
imshow(img)
V = img;
imshow(V)


%{
A = imresize(V, [16 16]);
imshow(A)
B = A(:);
C = double(B) ./ double(255);
C = C';
D = 1 - C

%row vector back to image
E = reshape(D,[16 16]);
E = uint8(255*E);
E = E';
imshow(E');

%}