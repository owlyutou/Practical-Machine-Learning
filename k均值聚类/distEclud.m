function [ dis ] = distEclud( vecA, vecB )
%% DISTECLUD
% 计算欧几里得距离
dis = sqrt(sum(power(vecA - vecB), 2));


end

