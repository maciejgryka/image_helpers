function dominant_dir = dominantGradientDir(patch)
%DOMINANTGRADIENTDIR returns the dominant gradient direction of a given
%patch. Based on SIFT method.
%
% returns empty matrix if all pixels are uniform
    if isa(patch, 'uint8')
        patch = double(patch) ./255;
    elseif ~isa(patch, 'double')
        patch = double(patch);
    end
    ms = zeros(size(patch));
    os = zeros(size(patch));
    for y = 2:size(patch,1)-1
        for x = 2:size(patch,2)-1
            ms(y,x) = sqrt((patch(y,x+1) - patch(y,x-1))^2 + (patch(y+1,x) - patch(y-1,x))^2);
            zz = (patch(y,x+1) - patch(y,x-1));
            xx = (patch(y+1,x) - patch(y-1,x));
            os(y,x) = atan(xx/zz);
            if ~isnan(os(y,x))
                a = 1;
            end
        end
    end
    
    ms = ms(2:size(ms,1)-1, 2:size(ms,2)-1);
    os = os(2:size(os,1)-1, 2:size(os,2)-1);
    
    o = os(:);
    m = ms(:);
    edges = -pi:2*pi/36:pi;
    
    [n, bin] = histc(o, edges);
    
    for i = 1:length(n)
        n(i) = n(i) * mean(m(bin==i));
    end
    
    max_edge = find(n==max(n));
    dominant_dir = (edges(max_edge) + edges(max_edge+1))/2;
    
    for i = 1:length(n)
        if n(i) >= n(max_edge)*0.8
            dominant_dir = (dominant_dir + (edges(i) + edges(i+1))/2)/2;
        end
    end
end