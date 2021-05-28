function [noise_performance_stats] = noise_performance_plots(vol_noise_performance_ST,noise)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Noise Performance Plots

n = length(noise);

noise_performance_stats(1:n) = struct('Noise_Level',[],'MSE_No_Filt',[],'MSE_Median',[],'MSE_Avg',[],...
    'MSE_Wiener',[],'PSNR_No_Filt',[],'PSNR_Median',[],'PSNR_Avg',[],'PSNR_Wiener',[],'SSIM_No_Filt',[],'SSIM_Median',[],'SSIM_Avg',[],...
    'SSIM_Wiener',[],'Total_vol_stats',[]);

vol_noise_performance = mean(vol_noise_performance_ST,3);

for i = 1:n
    
    noise_performance_stats(i).Noise_Level = noise(i);
    noise_performance_stats(i).MSE_No_Filt = vol_noise_performance(i,10);
    noise_performance_stats(i).MSE_Median  = vol_noise_performance(i,1);
    noise_performance_stats(i).MSE_Avg  = vol_noise_performance(i,2);
    noise_performance_stats(i).MSE_Wiener  = vol_noise_performance(i,3);
    noise_performance_stats(i).PSNR_No_Filt  = vol_noise_performance(i,11);
    noise_performance_stats(i).PSNR_Median  = vol_noise_performance(i,4);
    noise_performance_stats(i).PSNR_Avg  = vol_noise_performance(i,5);
    noise_performance_stats(i).PSNR_Wiener  = vol_noise_performance(i,6);
    noise_performance_stats(i).SSIM_No_Filt  = vol_noise_performance(i,12);
    noise_performance_stats(i).SSIM_Median  = vol_noise_performance(i,7);
    noise_performance_stats(i).SSIM_Avg  = vol_noise_performance(i,8);
    noise_performance_stats(i).SSIM_Wiener  = vol_noise_performance(i,9);
    noise_performance_stats(i).Total_vol_stats = vol_noise_performance_ST;
    
end

%% MSE

figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,3,1)
plot(noise,vol_noise_performance(:,1),'-o','LineWidth',3);
hold on
plot(noise,vol_noise_performance(:,2),'-o','LineWidth',3);
plot(noise,vol_noise_performance(:,3),'-o','LineWidth',3);

hold off
xticks(noise);
title('MSE of Different Filtering Methods','fontweight','bold','fontsize',20);
ylabel('MSE','fontweight','bold','fontsize',20);
xlabel('Additive Noise Level (%)','fontweight','bold','fontsize',20);
legend('Median Filter','Average Filter','Wiener Filter','fontweight','bold','fontsize',16);

%% PSNR

subplot(1,3,2)
plot(noise,vol_noise_performance(:,4),'-o','LineWidth',3);
hold on
plot(noise,vol_noise_performance(:,5),'-o','LineWidth',3);
plot(noise,vol_noise_performance(:,6),'-o','LineWidth',3);

hold off
xticks(noise);
title('PSNR of Different Filtering Methods','fontweight','bold','fontsize',20);
ylabel('PSNR (dB)','fontweight','bold','fontsize',20);
xlabel('Additive Noise Level (%)','fontweight','bold','fontsize',20);
legend('Median Filter','Average Filter','Wiener Filter','fontweight','bold','fontsize',16);

%% Structural Similarity Index (SSIM) for measuring image quality

subplot(1,3,3)
plot(noise,vol_noise_performance(:,7),'-o','LineWidth',3);
hold on
plot(noise,vol_noise_performance(:,8),'-o','LineWidth',3);
plot(noise,vol_noise_performance(:,9),'-o','LineWidth',3);

hold off
xticks(noise);
title('SSIM of Different Filtering Methods','fontweight','bold','fontsize',20);
ylabel('SSIM','fontweight','bold','fontsize',20);
xlabel('Additive Noise Level (%)','fontweight','bold','fontsize',20);
legend('Median Filter','Average Filter','Wiener Filter','fontweight','bold','fontsize',16);

%% Scroll

GTscroll;
end

