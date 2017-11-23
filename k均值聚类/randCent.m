function [ centroids ] = randCent( dataSet, k )
%% RANDCENT
% 为给定数据集构建一个包含k个随机质心的集合
n = size(dataSet, 2);
centroids = zeros(k, n);
for j = 1:n
    minJ = min(dataSet(:, j));
    rangeJ = max(dataSet(:, j)) - minJ;
    centroids(:, j) = minJ + rangeJ * rand(k, 1);
end


end

