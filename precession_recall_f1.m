function [precision,recall,f1] = precession_recall_f1(TP,FN,FP)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%% Precision
precision = TP / (TP + FP);

%% Recall
recall = TP / (TP + FN);

%% F1-score
f1 = 2 * (precision * recall) / (precision + recall);

end

