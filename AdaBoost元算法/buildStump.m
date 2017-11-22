function [ bestStump, minError, bestClassEst ] = buildStump( dataMat, classLabels, D )
%% BUILDSTUMP
% 构建单层决策树(决策树桩)
labelMat = classLabels';
[m, n] = size(dataMat);
numSteps = 10; 
bestStump = containers.Map;
bestClassEst = zeros(m, 1);
minError = inf;

for i = 1:n
    rangeMin = min(dataMat(:, i));
    rangeMax = max(dataMat(:, i));
    stepSize = (rangeMax - rangeMin) / numSteps;
    stepNum = -1:numSteps;
    foot = size(stepNum, 2);
    for j = -1:numSteps
        inequal = [0, 1];
        for k = 1: 2     % 遍历inequal
            threshVal = rangeMin + j * stepSize;
            direction = inequal(k);
            predictedVals = stumpClassify(dataMat, i, threshVal, direction);
            errArr = ones(m ,1);
            errArr(predictedVals == labelMat) = 0;
            weightedError = D' * errArr;
            % fprintf('split: dim %d, thresh %f, thresh inequal: %d, the weighted error is %f\n', i, threshVal, direction, weightedError);
            if weightedError < minError
                minError = weightedError;
                bestClassEst = predictedVals;
                bestStump('dim') = i;
                bestStump('thresh') = threshVal;
                bestStump('ineq') = direction;
            end
        end
    end
end


end

