function [ weights ] = gradAscend( dataMatIn, classLabels )
%% GRADASCEND
% 使用梯度回归上升方法确定权重
% dataMatIn是m个有n个属性的样本,classLabels是对应的列向量
[~, n] = size(dataMatIn);
alpha = 0.001;
maxCycles = 500;
weights = ones(n, 1);
for i = 1: maxCycles
    h = sigmoid(dataMatIn * weights);
    error = classLabels - h;
    weights = weights + alpha * dataMatIn' * error;
end

end

