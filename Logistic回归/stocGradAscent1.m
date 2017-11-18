function [ weights ] = stocGradAscent1( dataMatrix, classLabels, iter )
%% STOCGRADASCENT0
% 改进随机梯度上升算法：增加迭代次数，每次调整alpha的值
% dataMatrix是m个有n个属性的样本,classLabels是对应的列向量,iter为迭代次数
[m, n] = size(dataMatrix);
weights = ones(1, n);
for it = 1:iter
    for i = 1: m
        alpha = 4 / (1+it+i) + 0.01;
        randIndex = unidrnd(m);
        h = sigmoid(sum(dataMatrix(randIndex, :) .* weights));
        error = classLabels(randIndex) - h;
        weights = weights + alpha * dataMatrix(randIndex, :) * error;
    end
end



end

