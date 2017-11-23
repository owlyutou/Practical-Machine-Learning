function [ b, alphas ] = smoPlatt( dataMat, classLabels, C, toler, maxIter )
%% SMOPLATT
% Platt SMO 外循环代码
% 初始化结构体
oS.X = dataMat;
oS.labelMat = classLabels';
oS.C = C;
oS.tol = toler;
oS.m = size(dataMat, 1);
oS.alphas = zeros(oS.m, 1);
oS.b = 0;
oS.eCache = zeros(oS.m, 2);

iter = 0;
entireSet = true; alphaPairsChanged = 0;
while(iter < maxIter) && ((alphaPairsChanged > 0) || (entireSet))
    alphaPairsChanged = 0;
    if entireSet
        for i = 1:oS.m
            alphaPairsChanged = alphaPairsChanged + innerL(i, oS);
            fprintf('fullset, iter: %d, i: %d, pairs changed: %d\n', iter, i, alphaPairsChanged);
        end
        iter = iter + 1;
    else
        nonBoundIs = find(oS.alphas > 0 & oS.alphas < C);
        numNonBoundIs = length(nonBoundIs);
        for i = 1:numNonBoundIs
            alphaPairsChanged = alphaPairsChanged + innerL(i, oS);
            fprintf('non-bound, iter: %d, i: %d, pairs changed: %d\n', iter, i, alphaPairsChanged);
        end
        iter = iter + 1;
    end
    if entireSet
        entireSet = false;
    elseif alphaPairsChanged == 0
        entireSet = true;
    fprintf('iteration number: %d\n', iter);
end
b = oS.b;
alphas = oS.alphas;

end

