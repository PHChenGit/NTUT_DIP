function b = sobelfilt(A)
    d = im2double(A);
    [height, width] = size(d);
    result = zeros([height, width]);
    for x=1:(height-2)
        for y=1:(width-2)
            Gx = sum(d(x:x+2, y:y+2).*[-1 -2 -1; 0 0 0; 1 2 1], "all");
            Gy = sum(d(x:x+2, y:y+2).*[-1 0 1; -2 0 2; -1 0 1], "all");
            result(x+1, y+1) = (sqrt(Gx*Gx+Gy*Gy));
        end
    end
    b = result;
end