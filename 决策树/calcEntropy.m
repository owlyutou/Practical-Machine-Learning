function [ entropy ] = calcEntropy( dataSet, labels )
%% CALCENTROPY
% 计算给定数据集的香农熵
% dataSet是给定的数据集矩阵， labels是dataSet样本对应的类别向量
[m, ~] = size(dataSet);
labelMap = containers.Map;
% 传入的键只能是字符串，然而字符串向量不存在，只有cell， 怎么办？
for i = 1: m
    currentLabel = labels(i);
    if ~labelMap.isKey(currentLabel)
        labelMap(currentLabel) = 0;
    end
    labelMap(currentLabel) = labelMap(currentLabel) + 1;
end
probMat = cell2mat(labelMap.values) / m;
entropy = -sum(probMat .* log(probMat));


end

