function [ weakClassArr ] = AdaBoostTrainDS( dataArr, classLabels, numIt)
%% ADABOOSTTRAINDS
% 基于单层决策树的AdaBoost训练过程
weakClassArr = [];
m = size(dataArr, 1);
D = ones(m, 1) / m;
aggClassEst = zeros(m, 1);
for i = 1:numIt
    [bestStump, error, classEst] = buildStump(dataArr, classLabels, D);


end

