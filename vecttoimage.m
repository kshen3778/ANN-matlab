function [E] = vecttoimage( D )
%Turn vector to image
E = reshape(D,[16 16]);
E = uint8(255*E);

end

