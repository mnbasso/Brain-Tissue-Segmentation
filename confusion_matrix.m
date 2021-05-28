function [TP,TN,FP,FN] = confusion_matrix(gt,predicted)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%% Finding TP, TN, FP, FN

if isa(gt,'double')
    gt = imbinarize(gt);
end

if isa(predicted,'double')
    predicted = imbinarize(predicted);
end

TP = length(find(predicted ==1 & gt == 1));
TN = length(find(predicted ==0 & gt == 0));
FP = length(find(predicted ==1 & gt == 0));
FN = length(find(predicted ==0 & gt == 1));
    

end
