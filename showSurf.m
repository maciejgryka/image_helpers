function showSurf(im)
    im = double(im);
    surf(im, 'LineStyle', 'none');
    set(gca, 'Projection', 'Perspective');
    colormap jet;
end