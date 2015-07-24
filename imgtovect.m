function [ D ] = imgtovect( V )
%resize image
A = imresize(V, [16 16]);
A = A'; %transpose image to send into algorithm
B = reshape(A, [1 256]);
%scale to values of between 0-1
C = double(B) ./ double(255);
%C = C';
D = 1 - C; %invert image

end

