function [ returnMat, labels ] = getMatrix( fileDir )
%% GETMATRIX
% 通过调用img2vector，将训练样本和测试样本转换为矩阵
dirStruct = dir(fileDir);
dirStruct(1) = []; dirStruct(1) = [];   % 使用dirStruct.name作为文件名数组

len = length(dirStruct);
returnMat = zeros(len, 1024);
labels = zeros(1, len);

for i = 1: len
    filename = dirStruct(i).name;
    fileStr = regexp(filename, '\.', 'split');  fileStr = char(fileStr(1));
    classNum = regexp(fileStr, '_', 'split');  classNum = str2double(classNum(1));
    returnMat(i, :) = img2vector([fileDir, '\', filename]);
    labels(i) = classNum;
end


end

