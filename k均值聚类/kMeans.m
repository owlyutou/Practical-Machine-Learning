function [ centroids, clusterAssment ] = kMeans( dataSet, k)
%% KMEANS
% k均值聚类算法
m = size(dataSet, 1);
clusterAssment = zeros(m, 2);
centroids = randCent(dataSet, k);
clusterChanged = true;
while clusterChanged
    clusterChanged = false;
    for i = 1:m
        minDist = inf;
        minIndex = -1;
        for j = 1:k
            distJI = distEclud(centroids(j, :), dataSet(i, :));
            if distJI < minDist
                minDist = distJI;
                minIndex = j;
            end
        end
        if clusterAssment(i, 1) ~= minIndex
            clusterChanged = true;
        end
        clusterAssment(i, :) = [minIndex, minDist ^ 2];
    end
    disp(centroids);
    for cent = 1:k
        ptsInClust = dataSet(clusterAssment(:, 1) == cent, :);
        centroids(cent, :) = mean(ptsInClust, 1);
    end
end

% 显示聚类结果
scatter(dataSet(:, 1), dataSet(:, 2), 50, clusterAssment(:, 1), 'filled');
hold on
scatter(centroids(:, 1), centroids(:, 2), 100, 'd');


end

