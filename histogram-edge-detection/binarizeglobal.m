function [imfinal] = binarizeglobal(orig,noise)
if (size(orig,3)==1)
    image = imnoise(orig,'gaussian',0,noise);
else
    image = imnoise(rgb2gray(orig),'gaussian',0,noise);
end

num_bins = 256;
%256 possible intensity values (0-255)
[counts, x] = imhist(image,num_bins);

thresh = int16(mean(x));
lower_bound = min(x)+2;%%+2 is due to indexing
upper_bound = max(x)-2;%%-2 also due to indexing
for k = 1:5
if (thresh>lower_bound)
region1x = x(lower_bound:thresh);
region1counts = counts(region1x);
mean1 = mean(region1counts);

region2x = x(thresh:upper_bound);
region2counts = counts(region2x);
mean2 = mean(region2counts);

meanpos1 = find(abs(region1counts-mean1)==min(abs(region1counts-mean1)),1);
mean1x = region1x(meanpos1);

meanpos2 = find(abs(region2counts-mean2)==min(abs(region2counts-mean2)),1);
mean2x = region2x(meanpos2);

thresh = int16((mean1x + mean2x)/2);
end
end
threshval = double(thresh)/256;
imfinal = imbinarize(image,threshval);
end
 




