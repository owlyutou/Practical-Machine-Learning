function [  ] = updateEk( oS, k )
%% UPDATEEK
% 更新eCache的标志位和Ek值
Ek = clacEk(oS, k);
oS.eCache(k) = [1, Ek];


end

