clc, clear;
%% 使用案例2：约会网站信息分类
load('datingTestSet2.txt');
datingDataMat = datingTestSet2(:, 1:3);
datingLabels = datingTestSet2(:, 4)';

% 分析数据
scatter(datingDataMat(:, 2), datingDataMat(:, 3), 50, datingLabels, 'filled')

% 数据预处理：归一化
stdData = mapminmax(datingDataMat', 0, 1)';

% 随机选取10%作为测试集
tmp = randperm(1000);
testIndex = tmp(1:100);
testSet = stdData(testIndex, :);
testLabels = datingLabels(testIndex);

% 剩余的作为训练集
trainIndex = setdiff(1:1000, testIndex);
trainSet = stdData(trainIndex, :);
trainLabels = datingLabels(trainIndex);
errNum = 0;
for i = 1:100
    result = classify0(testSet(i,:), trainSet, trainLabels, 3);
    if result ~= testLabels(i)
        errNum = errNum + 1;
    end
end
disp('误分率为');
disp(errNum / 100);