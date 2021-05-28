function [score, precission, recall] = bfscore(TP,FP,FN)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here


%% Precission

precission = TP/(TP+FP);

%% Recall

recall = TP/(TP+FN);

%% Score

score = (2*precission*recall)/(recall+precission);

end

