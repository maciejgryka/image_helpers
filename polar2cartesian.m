function [x, y]= polar2cartesian(magnitude, orientation)
%POLAR2CARTESIAN takes pixel offset in polar coordinates and returns
%cartesians
%   POLAR is a 2-vector with magnitude and orientation
    x = round(magnitude * cos(orientation));
    y = round(magnitude * sin(orientation));
end