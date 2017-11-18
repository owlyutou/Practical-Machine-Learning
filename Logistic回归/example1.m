clc, clear;
%% 使用Logistics梯度回归上升方法进行二维平面上的点分类
% 准备数据集
load('testSet.txt');
[m, n] = size(testSet);
dataMatIn = [ones(m, 1), testSet(:, 1:n-1)];
classLabels = testSet(:, n);
% 使用梯度上升算法
% weights = gradAscend(dataMatIn, classLabels);
% 使用梯度随机上升法
% weights = stocGradAscent0(dataMatIn, classLabels);
% 使用改进梯度随机上升法
weights = stocGradAscent1(dataMatIn, classLabels, 150);

% 画出决策边界
scatter(dataMatIn(:, 2), dataMatIn(:, 3), 80, classLabels, 'filled')
hold on
syms x
y = @(x) (-weights(1)-weights(2)*x)/weights(3);
fplot(y, [-4, 4])
