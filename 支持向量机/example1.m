clc, clear
%% 在线性可分的二维平面上应用支持向量机
load('testSet.txt');
dataMat = testSet(:, 1:2);
labelMat = testSet(:, 3);

[b, alphas] = smoSimple(dataMat, labelMat, 0.6, 0.001, 40);

% 输出支持向量
[m, ~] = size(alphas);
for i = 1: m
    if alphas(i) > 0
        disp([dataMat(i, :), labelMat(i)]);
    end
end
