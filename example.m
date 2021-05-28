clear
clc

ST= 3;
noise = 7;

% load T1 MRI with ST = 3, and noise level = 7;
[vol] = load_brain(ST,noise);

% show the slice 15
figure; imshow(vol(:,:,15), []);title(['Original MRI Image, Slice 15'])


% load corresponding ground truth masks
[csf, gm, wm, brainMask] = load_brain_GT(ST);

% remove skull (and keep only brain region)
vol = vol .* brainMask;

% view images
figure; imshow(vol(:,:,15), []); title(['Brain Extracted MRI Image (ST=3), Slice 15'])
figure; imshow(csf(:,:,15), []); title(['Ground truth CSF (ST=3), Slice 15'])
figure; imshow(wm(:,:,15), []); title(['Ground truth WM (ST=3), Slice 15'])
figure; imshow(gm(:,:,15), []); title(['Ground truth GM (ST=3), Slice 15'])