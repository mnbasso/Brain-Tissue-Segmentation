function [average_filt] = avg_filter(I,win_size)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

h = fspecial('average',win_size);

average_filt = imfilter(I, h);


end

