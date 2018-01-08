clc, clear;
%% 在二维平面上应用聚类算法
dataMat = load('testSet.txt');
[ centroids, clusterAssment ] = kMeans( dataMat, 4);

