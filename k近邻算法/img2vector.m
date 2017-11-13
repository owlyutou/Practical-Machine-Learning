function [ returnVect ] = img2vector( filename )
%% IMG2VECTOR 
% 将32*32的图像(文本)转换为1*1024的向量(数值)
fr = fopen(filename, 'r');
returnVect = zeros(1, 1024);
for i = 1: 32
    lineStr = fgetl(fr);
    for j = 1: 32
        returnVect(1, 32*(i-1)+j) = str2double(lineStr(j));
    end
end
fclose(fr);


end

