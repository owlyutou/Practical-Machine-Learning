function [ centroids, clusterAssment ] = kMeans( dataSet, k, distMeas, createCent )
%% KMEANS
% k均值聚类算法
m = size(dataSet, 1);
clusterAssment = zeros(m, 2);
centroids = createCent(dataSet, k);
clusterChanged = true;
while clusterChanged
    clusterChanged = false;
    for i = 1:m
        minDist = inf;
        minIndex = -1;
        for j = 1:k
            distJI = distMeas(centroids(j, :), dataSet(i, :));
            if distJI < distMeas(centroids)
    end


end

