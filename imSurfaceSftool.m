function imSurfaceSftool(im)
%IMSURFACESFTOOL(IMAGE) shows IMAGE as a surface in sftool, where IMAGE is
%a MxN array.
%
%   If IMAGE is RGB, it's converted to grayscale with RGB2GRAY.
%

    if size(im,3) == 3
        im = rgb2gray(im);
    end

    [y, x] = size(im);

    [xx yy] = meshgrid(1:x,1:y);

    xx = xx(:);
    yy = yy(:);
    zz = im(:);

    zeroPoints = (zz == 0);
    onePoints = (zz == 1);

    w = double((zeroPoints + onePoints) == 0);

    sftool(xx, yy, zz, w);
end