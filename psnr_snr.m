function [peaksnr,snr] = psnr_snr(I,ref)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%% MSE
err = mse(I,ref);

%% PSNR
peakval = diff(getrangefromclass(I));
peaksnr = 10*log10(peakval.^2/err);

%% SNR

if isinteger(ref)
    ref = double(ref);
end
    
snr = 10*log10(mean(ref(:).^2)/err);


end

