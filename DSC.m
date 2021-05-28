function [dsc] = DSC(TP,FP,FN)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here


dsc = (2*TP)/(2*TP + FP + FN);

end

