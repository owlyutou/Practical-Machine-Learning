function [ flag ] = innerL( i, oS )
%% INNERL
% 完整Platt SMO算法中的优化例程: 选用启发式算法选择第二个alpha
Ei = calcEk(oS, i);
if ((oS.labelMat(i) * Ei < -oS.tol) && (oS.alphas(i) < oS.C)) || ...
((oS.labelMat(i) * Ei > oS.tol) && (oS.alphas(i) > 0))
    [j, Ej] = selectJ(i, oS, Ei);
    alphaIold = oS.alphas(i);
    alphaJold = oS.alphas(j);

    if labelMat(i) ~= labelMat(j)
        L = max(0, oS.alphas(j) - oS.alphas(i));
        H = min(oS.C, oS.C + oS.alphas(j) - oS.alphas(i));
    else
        L = max(0, oS.alphas(j) + oS.alphas(i) - oS.C);
        H = min(oS.C, oS.alphas(j) + oS.alphas(i));
    end

    if L == H
        disp('L == H');
        flag = 0;
        return;
    end

    eta = 2 * oS.X(i, :) * oS.X(j, :)' - oS.X(i, :) * oS.X(i, :)' ...
            - oS.X(j, :) * oS.X(j, :)';

    if eta >= 0
        disp('eta >= 0');
        flag = 0;
        return;
    end
            
    oS.alphas(j) = oS.alphas(j) - oS.labelMat(j) * (Ei - Ej) / eta;
    oS.alphas(j) = clipAlpha(oS.alphas(j), H, L);

    updateEk(oS, j);
            
    if abs(alphas(j) - alphaJold)  < 0.00001
        disp('j not moving enough');
        flag = 0;
        return;
    end

    updateEk(oS, i);

    oS.alphas(i) = oS.alphas(i) + oS.labelMat(j) * oS.labelMat(i) * (alphaJold - oS.alphas(j));
            
    b1 = oS.b - Ei - oS.labelMat(i) * (oS.alphas(i) - alphaIold) * oS.X(i, :) * oS.X(i, :)' ...
            - oS.labelMat(j) * (oS.alphas(j) - alphaJold) * oS.X(i, :) * oS.X(j, :)';
    b2 = oS.b - Ej - oS.labelMat(i) * (oS.alphas(i) - alphaIold) * oS.X(i, :) * oS.X(j, :)' ...
            - oS.labelMat(j) * (oS.alphas(j) - alphaJold) * oS.X(j, :) * oS.X(j, :)';
            
    if (0 < oS.alphas(i)) && (oS.C > oS.alphas(i))
        oS.b = b1;
    elseif (0 < alphas(j)) && (C > alphas(j))
        oS.b = b2;
    else
        oS.b = (b1 + b2) / 2;
        flag = 1;
        return;
    end
end


end

