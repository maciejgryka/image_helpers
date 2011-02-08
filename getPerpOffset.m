function [xOff, yOff] = getPerpOffset(p1, p2)
% GETPERPOFFSET Returns offset that, added to any point on a line segment specified by p1
% and p2, produces another segment perpendicular to the original
%
% takes two points [x y] as arguments and returns offset [xOff yOff]

    % define rotation matrix
    rot = pi/2;
    rotM = [cos(rot) -sin(rot); sin(rot) cos(rot)];

    % ensure the points are column vectors
    p1 = reshape(p1, 2, 1);
    p2 = reshape(p2, 2, 1);
    
    midPoint = [(p1(1)+p2(1))/2; (p1(2)+p2(2))/2];

    % center the points (rp1 = rotated p1)
    rp1 = p1 - midPoint;

    % rotate the points
    rp1 = rotM * rp1;

    % re-center
    rp1 = rp1 + midPoint;
    
    off = rp1 - midPoint;

    xOff = off(1);
    yOff = off(2);
end