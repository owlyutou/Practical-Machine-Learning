function [ j, Ej ] = selectJ( i, oS, Ei )
%% SELECTJ
% 选择具有最大步长的j
maxK = -1; maxDeltaE = 0; Ej = 0;
oS.eCache(i, :) = [1, Ei];
validEcacheList = find(oS.eCache(:, 1) ~= 0);
numList = length(validEcacheList);
if numList > 1
    for k = 1:numList
        if k == i
            continue;
        end
        Ek = calcEk(oS, k);
        deltaE = abs(Ei - Ek);
        if deltaE > maxDeltaE
            maxK = k;
            maxDeltaE = deltaE;
            j = maxK;
            Ej = Ek;
        end
    end
else
    j = selectJRand(i, oS.m);
    Ej = calcEk(oS, j);


end

