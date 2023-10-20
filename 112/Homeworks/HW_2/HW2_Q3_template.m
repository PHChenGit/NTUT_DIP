clear; clc; close all;

testimg1 = imread('circuit.tif');
testimg2 = imread('face.tif');
testimg3 = imread('moon.tif');

%% Show (a)
Q3_show(testimg1, 'medianfilter(img, 5)', 'medianfilterred image')
Q3_show(testimg2, 'medianfilter(img, 5)', 'medianfilterred image')

%% Show (b)
Q3_show(testimg1, 'gaussfilter(img, 1, 5, 10)', 'gaussfilterred image')
Q3_show(testimg2, 'gaussfilter(img, 1, 5, 10)', 'gaussfilterred image')

%% Show (c)
Q3_show(testimg3, 'highboostfilter(img, 2, 5)', 'highboostfiltered image')

%%
function O = medianfilter(I, filter_size)
    % O is filtered image, I is original image

    % your implementation here ...
    [w, h] = size(I);
    pad_size = floor(filter_size / 2);
    padded_img = padarray(I, [pad_size, pad_size]);

    for x = 1+pad_size : size(padded_img, 1) - pad_size
        for y = 1+pad_size : size(padded_img, 2) - pad_size
            window = padded_img(x-pad_size:x+pad_size, y-pad_size:y+pad_size);
            M = median(window(:));
            O(x-pad_size, y-pad_size) = M;
        end
    end
end

function O = gaussfilter(I, K, filter_size, sigma)
    % O is filtered image, I is original image

    padding_size = floor(filter_size/2);
    padded_img = padarray(im2double(I), [padding_size, padding_size]);

    % Calculate gaussian kernel
    kernel_window = zeros(filter_size, filter_size);

    for x = 1:filter_size
        for y = 1:filter_size
            x1 = x - padding_size;
            y1 = y - padding_size;
            g  = K * exp((x1^2 + y1^2) / (2*(sigma^2)));
            kernel_window(x, y) = g;
        end
    end

    total_g = sum(kernel_window(:));
    kernel_window = kernel_window ./ total_g;

    % Convolution
    O = conv2(padded_img, kernel_window, "valid");
end

function O = highboostfilter (I, A, filter_size)
    % O is filtered image, I is original image
end

function Q3_show(img, string, titlestr)
    figure()
    result = eval(string);
    subplot(1,2,1); imshow(img); title("Original image");
    subplot(1,2,2); imshow(result); title(titlestr);
end