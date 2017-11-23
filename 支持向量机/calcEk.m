function [ Ek ] = calcEk( oS, k )
%% CALCEK
% 低于给定的alpha值计算误差Ek
fXk = (oS.alphas .* oS.labelMat)' * (oS.X * oS.X(k, :)') + oS.b;
Ek = fXk - os.labelMat(k);


end

