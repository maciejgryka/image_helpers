function point = getRandomImagePoint(im)
    point = [round(rand(1) * size(im,2)), round(rand(1) * size(im,1))];
end