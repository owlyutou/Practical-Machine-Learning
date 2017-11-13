function [ result ] = classify0( inX, dataSet, labels, k )
%% CLASSIFY0 
% 最近邻法的MATLAB实现
% inX是待分类的输入向量，dataSet是训练样本矩阵，
% labels是训练样本的类别向量，k为选取的最邻近个数
[rowNum, ~] = size(dataSet);
diffMat = repmat(inX, rowNum, 1) - dataSet;
distances = sqrt(sum(diffMat .* diffMat, 2));
[~, sortedDistancesIndicies] = sort(distances);

labelSize = numel(unique(labels));
classCount = [unique(labels)', zeros(labelSize, 1)];
for i = 1:k
    votelabel = labels(sortedDistancesIndicies(i));
    classCount(classCount(:,1) == votelabel, 2) = classCount(classCount(:,1) == votelabel, 2) + 1;
end
[~, optimalLoc] = max(classCount(:,2));
result = classCount(optimalLoc, 1);

end

