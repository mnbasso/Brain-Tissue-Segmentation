% Copyright: Matthew Basso, 2020
% Not to be distributed or modified.

% Assignment 1 -  Unsupervised Segmentation in MRI

clear
close all
clc
warning('off');

%% Filtering and Segmentation Algorithm

tic;

ST = [1,3,5,7,9];
noise = [0,1,3,5,7,9];
method = ["k-means"]; % Segmentation Methods :"k-means","otsu","gaussian_mixture"

fprintf('Segementation Method: %s \n',method);

vol_noise_performance_ST = zeros(length(noise),12,length(ST));
vol_seg_performance_ST = zeros(length(noise),21,length(ST));
vol_seg_performance_ST_no_filtering = zeros(length(noise),21,length(ST));

for st = 1:length(ST)
    
    for n = 1:length(noise)
        
        disp(['Slice Thickenss: ',num2str(ST(st)),', Additive Noise Level: ', num2str(noise(n)),'%']);
        
        % Load in Brain Images with GT's
        
        [vol,vol_no_noise,csf, gm, wm] = load_brain_images(ST(st),noise(n));
        
        % Pre-processing (Median filter, averaging filter, and weiner filter)
        
        win_size = 3;
        
        [vol_med_filt,vol_average_filt,vol_weiner_filt,Noise_performance] = preprocessing_filtering(vol,vol_no_noise,win_size,'false');
        
        % Segmentation and Performance
        
        attempts = 3;
        clusters = 4;
        I_filt = vol_weiner_filt;
        I_non_filt = vol;
        
        [Seg_performance,Seg_performance_no_filtering] = segmentation_and_performance(I_filt,I_non_filt,ST(st),clusters,method,attempts,csf,gm,wm,'false');
        
        
        % Storing all stats
        
        vol_noise_performance_ST(n,:,st) = mean(Noise_performance(any(Noise_performance ~= 0,2),:),1);
        
        Seg_performance(any(isnan(Seg_performance), 2), :) = [];
        vol_seg_performance_ST(n,:,st) = mean(Seg_performance,1);
        
        Seg_performance_no_filtering(any(isnan(Seg_performance_no_filtering), 2), :) = [];
        vol_seg_performance_ST_no_filtering(n,:,st) = mean(Seg_performance_no_filtering,1);
        
    end
    
end

toc;

GTscroll
%% Noise Performance Plots

noise_performance_stats = noise_performance_plots(vol_noise_performance_ST,noise);

%% Segmentation Performance Plots

[segmentation_performance_stats,non_filtered_segmentation_performance_stats] = segmentation_performance_plots(vol_seg_performance_ST,vol_seg_performance_ST_no_filtering,noise,ST);

