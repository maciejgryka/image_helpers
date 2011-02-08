function point = checkImBounds(point, bounds)
%CHECKIMBOUNDS(POINT, BOUNDS) Checks whether the point is within the given 
%bounds and if not, returns the closest one that is.
%
%   example:
%       point = checkImBounds(point, size(image))
%
    if point(1) > bounds(2)
        point(1) = bounds(2);
    elseif point(1) < 1
        point(1) = 1;
    end  

   if point(2) > bounds(1)
        point(2) = bounds(1);
    elseif point(2) < 1
        point(2) = 1;
    end  
end