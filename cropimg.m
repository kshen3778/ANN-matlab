function [ cropped ] = cropimg(img, limit)
[m,n,l] = size(img);

%sharpen image(<=limit goes to 0, >limit goes to 255)
for row=1:m
   for col=1:n
      if img(m,n) <= limit
          img(m,n) = 0;
      else
          img(m,n) = 255;
      end
   end
end

%crops a handwritten digit
left = 0;
right = 0;
top = 0;
bottom = 0;

%get left most column
for col=1:n %columns
    for row=1:m
        if img(row, col) < 255,
            left = col;
            break;
        end
    end
    
    if left ~= 0,
        break;
    end
end

%get right most column
for col=n:-1:1 %columns
    for row=m:-1:1
        if img(row, col) < 255,
            right = col;
            break;
        end
    end
    
    if right ~= 0,
        break;
    end
end

%get top most row
for col=1:m %rows
    for row=1:n
        if img(row, col) < 255,
            top = row;
            break;
        end
    end
    
    if top ~= 0,
        break;
    end
end

%get bottom most row
for col=m:-1:1 %rows
    for row=n:-1:1
        if img(row, col) < 255,
            bottom = row;
            break;
        end
    end
    
    if bottom ~= 0,
        break;
    end
end



%crop the images
cropped = img(top:bottom,left:right,:);
