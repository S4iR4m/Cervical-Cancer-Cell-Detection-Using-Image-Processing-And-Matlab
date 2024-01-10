function [OverlapImage, DiceCoef] = DiceSimilarity2DImage(img1, img2)
% The steps are:
% 1. Set one image non-zero values as 200
img1(img1 > 0) = 200;

% 2. Set second image non-zero values as 300
img2(img2 > 0) = 300;

% 3. Set overlap area as 100
OverlapImage = img2 - img1;

% 4. Count the overlap 100 pixels
[r, c, v] = find(OverlapImage == 100);
countOverlap100 = size(r);

% 5. Count the image 200 pixels
[r1, c1, v1] = find(img1 == 200);
img1_200 = size(r1);

% 6. Count the image 300 pixels
[r2, c2, v2] = find(img2 == 300);
img2_300 = size(r2);

% 7. Calculate Dice Coef
DiceCoef = 2 * countOverlap100 / (img1_200 + img2_300);

% 8. Visualize the volumes by slicing
figure(1);
image(OverlapImage);
colormap(gray);
title('Overlapping area used to calculate Dice Coef');

% Command
% [a, b] = DiceSimilarity2DImage(cropprostmask1, cropprostmask2);
