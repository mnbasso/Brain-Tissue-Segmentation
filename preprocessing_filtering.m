function [vol_med_filt,vol_average_filt,vol_weiner_filt,Noise_performance] = preprocessing_filtering(vol,vol_no_noise,win_size,plot_show)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


Noise_performance = zeros(size(vol,3),12,1);
vol_med_filt = zeros(size(vol,1,2,3));
vol_average_filt = zeros(size(vol,1,2,3));
vol_weiner_filt = zeros(size(vol,1,2,3));

for i = 1:size(vol,3)
    
    I = uint8(vol(:,:,i));
    I_no_noise = uint8(vol_no_noise(:,:,i));
        
    if sum(sum(I))>0
        
        [med_filt,average_filt,weiner_filt,filter_performance] = preprocessing(I,I_no_noise,win_size,plot_show);
        
    else
        
        filter_performance = zeros(1,12);
        med_filt = zeros(size(I));
        average_filt = zeros(size(I));
        weiner_filt = zeros(size(I));
        
    end
    
    Noise_performance(i,:,1) = filter_performance;
    
    vol_med_filt(:,:,i) = med_filt;
    vol_average_filt(:,:,i) = average_filt;
    vol_weiner_filt(:,:,i) = weiner_filt;
end


end

