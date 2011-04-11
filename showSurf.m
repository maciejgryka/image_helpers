function showSurf(im)
    im = double(im);
    if isrgb(im)
        im = rgb2gray(im);
    end
    surf(im, 'LineStyle', 'none');
    set(gca, 'Projection', 'Perspective');
    colormap jet;
end