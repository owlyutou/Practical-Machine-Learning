clc, clear;
%% 使用案例3：手写识别系统
% 求取训练集和测试集
[trainSet, trainLabels] = getMatrix('trainingDigits');
[testSet,     testLabels] = getMatrix('testDigits');

[m, ~] = size(testSet);
errCount = 0;
for i = 1: m
    classiferResult = classify0(testSet(i, :), trainSet, trainLabels, 3);
    if classiferResult ~= testLabels(i)
        errCount = errCount + 1;
    end
end

disp('分类错误率为：');
disp(errCount/m);