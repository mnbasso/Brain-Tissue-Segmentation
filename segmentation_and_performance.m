function [Seg_performance,Seg_performance_no_filtering] = segmentation_and_performance(I_filt,I_non_filt,ST,clusters,method,attempts,csf,gm,wm,plot_show)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

I_filt = uint8(I_filt);
I_non_filt = uint8(I_non_filt);

%% Segmentation with Preprocessing

[imlabel] = segmentation(I_filt,clusters,method,attempts,plot_show);

%% Segmentation with No Preprocessing

[imlabel_no_filtering] = segmentation(I_non_filt,clusters,method,attempts,plot_show);

%% Segmentation Performance

Seg_performance = zeros(size(I_filt,3),21);
Seg_performance_no_filtering = zeros(size(I_filt,3),21);

for i = 1:size(I_filt,3)
    
    gt_csf = csf(:,:,i);
    gt_gm = gm(:,:,i);
    gt_wm = wm(:,:,i);
    
    Seg_performance(i,:) = performance(gt_csf, gt_gm, gt_wm, imlabel(:,:,i), I_filt(:,:,i), method, ST,i,plot_show);
    Seg_performance_no_filtering(i,:) = performance(gt_csf, gt_gm, gt_wm, imlabel_no_filtering(:,:,i), I_non_filt(:,:,i), method, ST,i,plot_show);
    
end


GTscroll;
end

