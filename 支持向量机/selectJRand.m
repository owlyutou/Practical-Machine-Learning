function [ j ] = selectJRand( i, m )
%% SELECTJRAND
% 随机选择一个不是i的alpha下标
j = i;
while j == i
    j = unidrnd(m);
end


end

