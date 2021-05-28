function [vdr] = VDR(FP,FN,TP)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

vdr = abs(FP-FN)/(TP+FN);

end

