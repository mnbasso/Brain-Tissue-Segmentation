function [int_norm] = intensity_scaling(I,gHIR, gLIR)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%% Intensity Scaling

int_norm = (I - gLIR)/(gHIR - gLIR);

end

