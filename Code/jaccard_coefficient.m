function [jaccardIdx, jaccardDist] = jaccard_coefficient(img_Orig, img_Seg)
% Jaccard index and distance co-efficient of segmented and ground truth image
% Usage: [index, distance(JC)] = jaccard_coefficient(Orig_Image, Seg_Image);

% Check for logical image
if ~islogical(img_Orig)
    error('Image must be in logical format');
end
if ~islogical(img_Seg)
    error('Image must be in logical format');
end

% Find the intersection of the two images
inter_image = img_Orig & img_Seg;

% Find the union of the two images
union_image = img_Orig | img_Seg;

% Calculate Jaccard index
jaccardIdx = sum(inter_image(:)) / sum(union_image(:));

% Display the Jaccard Inde
%fprintf('Jaccard Index: %.4f\n', jaccardIdx);

% Calculate Jaccard distance (complement of Jaccard index)
jaccardDist = 1 - jaccardIdx;