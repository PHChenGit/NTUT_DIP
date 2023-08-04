function result = wiener(img, size)
    img_ = im2double(img);
    mean = filter2(ones(size), img_)/prod(size);
    var = filter2(ones(size), img_.^2)/prod(size) - mean.^2;
    result = img_ - mean;
    result = (result ./ max(var, mean2(var))) .*  max((var - mean2(var)), 0) + mean;
end