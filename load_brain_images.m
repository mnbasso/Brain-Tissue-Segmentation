function [vol,vol_no_noise,csf, gm, wm] = load_brain_images(ST,noise)
%This function loads in brain images and outputs brain volumes
%according to noise level and slice thickness


%% Loading in T1 MRI Volume with ST, and noise level

[vol] = load_brain(ST,noise);

%% Loading in T1 with no noise

[vol_no_noise] = load_brain(ST,0);

%% Loading in Groundtruth T1 MRI Volume with ST, and noise level

[csf, gm, wm, brainMask] = load_brain_GT(ST);

%% Remove skull (and keep only brain region) for volume with noise and no noise

vol = vol .* brainMask;

vol_no_noise = vol_no_noise.*brainMask;


end

