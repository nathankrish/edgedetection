function [smoothGradient] = canny(I)
sigma = 1;
smoothImage = imgaussfilt(im2uint8(I),sigma);
smoothGradient = imgradient(smoothImage,'CentralDifference');
end
% figure
% imshow(I,[])
% figure
