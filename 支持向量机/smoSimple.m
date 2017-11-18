function [ b, alphas ] = smoSimple( dataMatrix, labelMat, C, toler, maxIter )
%% SMOSIMPLE
% 简化版的SMO算法求解支持向量机的对偶问题中的alphas
b = 0;
[m, ~] = size(dataMatrix);
alphas = zeros(m, 1);
iter = 0;

while iter < maxIter
    alphaPairsChanged = 0;
    for i = 1: m
        fXi = (alphas .* labelMat)' * (dataMatrix * dataMatrix(i, :)') + b;
        Ei = fXi - labelMat(i);

        if ((labelMat(i) * Ei < -toler) && (alphas(i) < C)) || ((labelMat(i) * Ei > toler) && (alphas(i) > 0))
            j = selectJRand(i, m);
            fXj = (alphas .* labelMat)' * (dataMatrix * dataMatrix(j, :)') + b;
            Ej = fXj - labelMat(j);
            alphaIold = alphas(i);
            alphaJold = alphas(j);

            if labelMat(i) ~= labelMat(j)
                L = max(0, alphas(j) - alphas(i));
                H = min(C, C + alphas(j) - alphas(i));
            else
                L = max(0, alphas(j) + alphas(i) - C);
                H = min(C, alphas(j) + alphas(i));
            end

            if L == H
                disp('L == H');
                continue;
            end

            eta = 2 * dataMatrix(i, :) * dataMatrix(j, :)' - dataMatrix(i, :) * dataMatrix(i, :)' ...
            - dataMatrix(j, :) * dataMatrix(j, :)';

            if eta >= 0
                disp('eta >= 0');
                continue;
            end
            
            alphas(j) = alphas(j) - labelMat(j) * (Ei - Ej) / eta;
            alphas(j) = clipAlpha(alphas(j), H, L);
            
            if abs(alphas(j) - alphaJold)  < 0.00001
                disp('j not moving enough');
                continue;
            end

            alphas(i) = alphas(i) + labelMat(j) * labelMat(i) * (alphaJold - alphas(j));
            
            b1 = b - Ei - labelMat(i) * (alphas(i) - alphaIold) * dataMatrix(i, :) * dataMatrix(i, :)' ...
            - labelMat(j) * (alphas(j) - alphaJold) * dataMatrix(i, :) * dataMatrix(j, :)';
            b2 = b - Ej - labelMat(i) * (alphas(i) - alphaIold) * dataMatrix(i, :) * dataMatrix(j, :)' ...
            - labelMat(j) * (alphas(j) - alphaJold) * dataMatrix(j, :) * dataMatrix(j, :)';
            
            if (0 < alphas(i)) && (C > alphas(i))
                b = b1;
            elseif (0 < alphas(j)) && (C > alphas(j))
                b = b2;
            else
                b = (b1 + b2) / 2;
            end

            alphaPairsChanged = alphaPairsChanged + 1;
            disp(['iter:', num2str(iter), ' i:', num2str(i), ', pairs changed ', num2str(alphaPairsChanged)]);
        end
    end

    if alphaPairsChanged == 0
        iter = iter + 1;
    else
        iter = 0;
    end
    disp(['iteration number:', num2str(iter)]);

end

