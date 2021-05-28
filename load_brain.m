% Copyright: April Khademi, 2012
% Not to be distributed or modified.
function [vol] = load_brain(ST, noise)

currentFolder = pwd;
filename = ['/t1_icbm_normal_',num2str(ST)','mm_pn',num2str(noise)','_rf0.rawb'];

x = 181;
y = 217;

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

% read in the volume
% Read in the data specified by fid (and typecast to double)
% reshape into images
fid = fopen([currentFolder, '/MRI/volumes/', filename], 'r');

v = double(fread(fid));
vol = reshape(v, x,y,z);

% Rotate so in axial direction 
vol = imrotate(vol, 90);

fclose all;

end
