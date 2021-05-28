function [svd] = SVD(dsc)
%UNTITLED4 Summary of this function goes here
%   Symmetric Volume Difference (SVD)
%       Provides a symmetric measure of the difference in volume of 
%       the segmentation result and the reference shape.
%       Segmentation errors are estimated with SVD

svd = 1 - dsc;


end

