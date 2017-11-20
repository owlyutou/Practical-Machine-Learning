clc, clear;
%% 在简单数据集上，基于单层决策树构建弱分类器，并使用AdaBoost元算法改进
dataMat = [1, 2.1; 
    2, 1.1; 
    1.3, 1; 
    1,    1; 
    2,    1];
classLabels = [1 1 -1 -1 1];
D = ones(5, 1) / 5;
[ bestStump, minError, bestClassEst ] = buildStump(dataMat, classLabels, D);
% 输出单层决策树结果
values(bestStump)