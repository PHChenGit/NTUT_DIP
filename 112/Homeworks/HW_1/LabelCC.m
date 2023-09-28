function result = LabelCC(img, num)
% component labeling with num-connected (num =4 or 8)

    [rows, cols] = size(img);
    visited = false(rows, cols);
    labels = zeros(rows, cols);
    labelCounter = 0;

    if num == 4
        % ------ implement your 4-connected components labeling algorithm here ------
        % result = your answer 
        for r = 1:rows
            for c = 1:cols
                if ~visited(r, c) && img(r, c) > 0
                    labelCounter = labelCounter + 1;
                    [newVisited, newLabels] = DFS_4Connected(r, c, img, labelCounter, visited, labels);
                    visited = newVisited;
                    labels = newLabels;
                end
            end
        end

        result = labels;

    elseif num ==8
        % ------ implement your 8-connected components labeling algorithm here ------
        % result = your answer 


    else
        error('MyFunc:InputMustbe4or8','The second argument should be 4 or 8.')
    end
end

function [newVisited, newLabels] = DFS_4Connected(x, y, img, labelCnt, visited, labels)
    [rows, cols] = size(img);

    if x >= 1 && x <= rows && ...
        y >= 1 && y <= cols && ...
        ~visited(x, y) && ...
        img(x, y) ~= 0

        visited(x, y) = true;
        labels(x, y) = labelCnt;

        [visited, labels] = DFS_4Connected(x, y+1, img, labelCnt, visited, labels);
        [visited, labels] = DFS_4Connected(x, y-1, img, labelCnt, visited, labels);
        [visited, labels] = DFS_4Connected(x-1, y, img, labelCnt, visited, labels);
        [visited, labels] = DFS_4Connected(x+1, y, img, labelCnt, visited, labels);
    end

    newVisited = visited;
    newLabels = labels;
end