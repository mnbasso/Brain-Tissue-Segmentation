function [Mean_Square_Error] = mse(I,I_filt)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[M,N] = size(I);

Mean_Square_Error = (norm(double(I_filt(:)) - double(I(:)),2).^2) / (M * N);

end

