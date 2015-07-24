function [ cropped ] = cropimg(img)
[m,n,l] = size(img);


%ALL VALUES greater than 240 should to rounded to 255
for row=1:m
   for col=1:n
      if img(row,col) > 240
          img(row,col,:) = 255;
      end
   end
end
 

%crops a handwritten digit
left = n;
right = 1;
top = 1;
bottom = 1;

%get left most column
for row=1:m %columns
    for col=1:n
        if img(row, col) < 255 && col < left,
            
             %found a more left col
             left = col;
             break;
            
        end
    end
    
end

%get right most column
for row=1:m %columns
    for col=n:-1:1
        if img(row, col) < 255 && col > right,
            
            %found a more right col
            right = col;
            break;
        end
    end

end

%get top most row
for row=1:m %rows
    for col=1:n
        if img(row, col) < 255,
            top = row;
            break;
        end
    end
    
    if top ~= 1,
        break;
    end
end

%get bottom most row
for row=m:-1:1 %rows
    for col=1:n
        if img(row, col) < 255,
            bottom = row;
            break;
        end
    end
    
    if bottom ~= 1,
        break;
    end
end



%crop the images
cropped = img(top:bottom,left:right,:);
