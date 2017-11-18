function [ label ] = classifyVector( inX, weights )
%% CLASSIFYVECTOR
% 根据prob计算结果预测类别
prob = sigmoid(sum(inX .* weights));
if prob > 0.5
    label = 1;
else
    label = 0;


end

