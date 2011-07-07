function grayOnGreen(im_gs)
    im_gs_size = size(im_gs);
    if length(im_gs_size) ~= 2
        error('Needs m-by-n grascale image.')
    end
    im = repmat(im_gs, [1, 1, 3]);
    im_r = im(:,:,1);
    im_b = im(:,:,3);
    im_r(im_gs == 1) = 0;
    im_b(im_gs == 1) = 0;
    im(:,:,1) = im_r;
    im(:,:,3) = im_b;
    imshow(im);
end