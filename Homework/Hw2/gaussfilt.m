function b = gaussfilt(A, filter_size, sigma)
    d = im2double(A);
    f = (filter_size-1)/2;
    [g1, g2] = meshgrid(-f:f, -f:f);
    g3 = exp(- (g1.^2+g2.^2) / (2*sigma^2));
    g = g3 ./ sum(g3(:));
    result = conv2(d, g, "valid");
    b = result;
end