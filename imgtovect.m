function [ D ] = imgtovect( V )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
A = imresize(V, [16 16]);
B = A(:);
C = double(B) ./ double(255);
%C = C';
D = 1 - C;

end

