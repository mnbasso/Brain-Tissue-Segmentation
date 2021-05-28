% Copyright: April Khademi, 2012
% Not to be distributed or modified.

% Load brainweb ground truth data
% get binary images for ground truth of CSF, WM and GM tissues
function [csf, gm, wm, brainMask] = load_brain_GT(ST)

currentFolder = pwd;

maskDir     = [currentFolder, '/groundtruth/groundtruth/'];

crispFile   = ['/phantom_',num2str(ST)','.0mm_normal_crisp.hdr'];

x = 181;
y = 217;
% Specify the number of slices (as a function of slice thickness
if(ST == 1)
    z = 181;
elseif(ST == 3)
    z = 60;
elseif(ST == 5)
    z = 36;
elseif(ST == 7)
    z = 26;
elseif(ST == 9)
    z = 20;
end

if(ST ~= 1)
% read in the volume
% Read in the data specified by fid (and typecast to double)
% reshape into images

phantom = analyze75read([maskDir, crispFile]);
% phantom = imrotate(phantom, 180);

else
    
    fid = fopen([maskDir, crispFile(1:end-3),'raw']);
    % Read in the data specified by fid (and typecast to double)
    phantom = double(fread(fid));
    % reshape into images
    phantom = reshape(phantom, x,y,z);
    phantom = imrotate(phantom, 90);

end

csf = zeros(size(phantom));
wm = zeros(size(phantom));
gm = zeros(size(phantom));
brainMask = zeros(size(phantom));

% Get discrete classifications
% 0=Background, 1=CSF, 2=Grey Matter, 3=White Matter, 4=Fat, 5=Muscle/Skin,
% 6=Skin, 7=Skull, 8=Glial Matter, 9=Connective, 10 =MS lesion

% Count CSF and Glial matter as one
ind = find(phantom == 1);
csf(ind) = 1;
brainMask(ind) = 1;

% Find GM
ind = find(phantom == 2);
gm(ind) = 2;
brainMask(ind) = 1;

% Find WM
ind = find(phantom == 3);
wm(ind) = 3;
brainMask(ind) = 1;
ind = find(phantom == 8);
wm(ind) = 3;
brainMask(ind) = 1;

fclose all;

end

