function [x] = vecttoimage( D )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
E = reshape(D,[16 16]);
E = uint8(255*E);
%E = E';
imshow(E)

end

