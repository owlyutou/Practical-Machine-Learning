function [ retArray ] = stumpClassify( dataMatrix, dim, threshVal, threshIneq )
%% STUMPCLASSIFY
% 通过阈值比较对样本进行分类
retArray = ones(size(dataMatrix, 1), 1);
if threshIneq == 0    % 0表示lt: less than
    retArray(dataMatrix(:, dim) <= threshVal) = -1;
else                   % 1表示gt: greater than
    retArray(dataMatrix(:, dim) >  threshVal) = -1;
end


end

