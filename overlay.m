% OverlayImgs
% Show an image with a transparent mask superimposed.
%
% function overlayImgs(img, binaryOverlay, overlayColor)
% img               - rows x cols x bands image
% binaryOverlay     - rows x cols binary image
% overlayColor      - length 3 color vector, each component between 0 and 1

function overlay(img, binaryOverlay, overlayColor)

if(size(img,3) == 3)

img(:,:,1) = (img(:,:,1) - min(min(img(:,:,1)))) / (max(max(img(:,:,1))) - min(min(img(:,:,1))));
img(:,:,2) = (img(:,:,2) - min(min(img(:,:,2)))) / (max(max(img(:,:,2))) - min(min(img(:,:,2))));
img(:,:,3) = (img(:,:,3) - min(min(img(:,:,3)))) / (max(max(img(:,:,3))) - min(min(img(:,:,3))));

colorImg = cat(3, overlayColor(1) * binaryOverlay, ...
    overlayColor(2) * binaryOverlay, overlayColor(3) * binaryOverlay);

binaryOverlay = repmat(binaryOverlay, [1 1 3]);
if size(img, 3) == 1
    img = repmat(img, [1 1 3]);
end
% imshow(uint8(img + 0.5 * binaryOverlay .* (colorImg - img)));
imshow((img + 0.5 * binaryOverlay .* (colorImg - img)));

else
  img(:,:,1) = (img(:,:,1) - min(min(img(:,:,1)))) / (max(max(img(:,:,1))) - min(min(img(:,:,1))));

colorImg = cat(3, overlayColor(1) * binaryOverlay, ...
    overlayColor(2) * binaryOverlay, overlayColor(3) * binaryOverlay);

binaryOverlay = repmat(binaryOverlay, [1 1 3]);
if size(img, 3) == 1
    img = repmat(img, [1 1 3]);
end
% imshow(uint8(img + 0.5 * binaryOverlay .* (colorImg - img)));
imshow((img + 0.5 * binaryOverlay .* (colorImg - img)));
end  