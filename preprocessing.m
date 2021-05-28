function [med_filt,average_filt,weiner_filt, filter_performance] = preprocessing(I,I_no_noise,win_size,show)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%% Filters

% Median filter
med_filt = medfilt2(I,[win_size win_size]);

% Averaging filter
average_filt = avg_filter(I,win_size);

% Weiner filter
weiner_filt = wiener2(I,[win_size win_size]);

%% Mean Squared Error (MSE)

[MSE_med] = mse(med_filt,I_no_noise);
[MSE_avg] = mse(average_filt,I_no_noise);
[MSE_weiner] = mse(weiner_filt,I_no_noise);
[MSE_no_filt] = mse(I,I_no_noise);

%% Signal-to-noise ratio

[psnr_median, ~] = psnr_snr(med_filt, I_no_noise);
[psnr_avg, ~] = psnr_snr(average_filt, I_no_noise);
[psnr_weiner, ~] = psnr_snr(weiner_filt, I_no_noise);
[psnr_no_filt, ~] = psnr_snr(I, I_no_noise);

%% Structural Similarity Index (SSIM) for measuring image quality

[ssimval_median,~] = ssim(med_filt, I_no_noise);
[ssimval_avg,~] = ssim(average_filt, I_no_noise);
[ssimval_weiner,~] = ssim(weiner_filt, I_no_noise);
[ssimval_no_filt,~] = ssim(I, I_no_noise);

%% Filters Performance Measurement

filter_performance = [MSE_med,MSE_avg,MSE_weiner,psnr_median,psnr_avg,psnr_weiner,ssimval_median,ssimval_avg,ssimval_weiner,...
    MSE_no_filt,psnr_no_filt,ssimval_no_filt];

%% Figures of Filtered Images
if strcmp(show,'true')
        
    figure;
    subplot(1,4,1)
    imshow(I,[]);
    title('Original Image','fontweight','bold','fontsize',16);
        
    subplot(1,4,2)
    imshow(med_filt,[]);
    title('Median Filtered Image','fontweight','bold','fontsize',16);
    
    subplot(1,4,3)
    imshow(average_filt,[]);
    title('Averaging Filtered Image','fontweight','bold','fontsize',16);
    
    subplot(1,4,4)
    imshow(weiner_filt,[]);
    title('Wiener Filtered Image','fontweight','bold','fontsize',16);
    
end

end

