function [ weights ] = stocGradAscent0( dataMatrix, classLabels )
%% STOCGRADASCENT0
% 改进梯度上升算法：使用随机梯度上升算法计算权重weights
% dataMatrix是m个有n个属性的样本,classLabels是对应的列向量
[m, n] = size(dataMatrix);
alpha = 0.01;
weights = ones(1, n);
for i = 1: m
    h = sigmoid(sum(dataMatrix(i, :) .* weights));
    error = classLabels(i) - h;
    weights = weights + alpha * dataMatrix(i, :) * error;
end


end

