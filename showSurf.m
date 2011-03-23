function showSurf(im)
    im = double(im);
    if size(im,3) == 3
        im = rgb2gray(im);
    end
    surf(im, 'LineStyle', 'none');
    set(gca, 'Projection', 'Perspective');
    colormap jet;
end