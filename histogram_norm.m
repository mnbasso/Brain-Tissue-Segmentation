function [hist_norm] = histogram_norm(I,gHIR, gLIR)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


hist_norm = (I - min(I(:))).*((gHIR - gLIR)./(max(I(:))- min(I(:)))+ gLIR);

end

