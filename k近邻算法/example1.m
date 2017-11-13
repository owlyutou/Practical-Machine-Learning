clc, clear
%% 使用案例1：二维平面上的点分类
dataSet = [1.0, 1.1; 1.0, 1.0; 0, 0; 0, 0.1];
labels = [1, 1, 0, 0];
disp('结果为：')
disp(classify0([0, 0], dataSet, labels, 3));