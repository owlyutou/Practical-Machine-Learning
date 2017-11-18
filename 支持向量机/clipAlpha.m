function [ aj ] = clipAlpha( aj, H, L )
%% CLIPALPHA
% 将alpha的值限定在一定范围内
if aj > H
    aj = H;
end
if aj < L
    aj = L;
end

end

