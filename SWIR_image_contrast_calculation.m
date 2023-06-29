%Import image
file = uigetfile('*.*');
raw_img = imread(file);
grayImage = fliplr(raw_img);

%Draw ROI in imfreehand and get ROI info
fontSize = 16;
imshow(grayImage, []);
axis on;
title('Original Grayscale Image', 'FontSize', fontSize);
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.

% Ask user to draw freehand mask for Lesion ROI.
message = sprintf('Left click and hold to begin drawing lesion ROI.\nSimply lift the mouse button to finish');
uiwait(msgbox(message));
hFH = imfreehand(); % Actual line of code to do the drawing.
% Create a binary image ("mask") from the ROI object.
binaryImage = hFH.createMask();
xy = hFH.getPosition;

% Ask user to draw freehand mask for Sound ROI.
message = sprintf('Left click and hold to begin drawing sound ROI.\nSimply lift the mouse button to finish');
uiwait(msgbox(message));
hFH2 = imfreehand(); % Actual line of code to do the drawing.
% Create a binary image ("mask") from the ROI object.
binaryImage2 = hFH2.createMask();
xy2 = hFH2.getPosition;

% Now make it smaller so we can show more images.
subplot(2, 4, 1);
imshow(grayImage, []);
axis on;
drawnow;
title('Original gray scale image', 'FontSize', fontSize);

% Display the freehand mask.
subplot(2, 4, 2);
imshow(binaryImage);
axis on;
title('Binary mask of the region', 'FontSize', fontSize);

% Label the binary image and computer the centroid and center of mass.
labeledImage = bwlabel(binaryImage);
measurements = regionprops(binaryImage, grayImage, ...
    'area', 'Centroid', 'WeightedCentroid', 'Perimeter');
area = measurements.Area
centroid = measurements.Centroid
centerOfMass = measurements.WeightedCentroid
perimeter = measurements.Perimeter

% Calculate the area, in pixels, that they drew.
numberOfPixels1 = sum(binaryImage(:))
% Another way to calculate it that takes fractional pixels into account.
numberOfPixels2 = bwarea(binaryImage)

% Get coordinates of the boundary of the freehand drawn region.
structBoundaries = bwboundaries(binaryImage);
xy=structBoundaries{1}; % Get n by 2 array of x,y coordinates.
x = xy(:, 2); % Columns.
y = xy(:, 1); % Rows.
subplot(2, 4, 1); % Plot over original image.
hold on; % Don't blow away the image.
plot(x, y, 'LineWidth', 2);
drawnow; % Force it to draw immediately.

% Burn region as white into image by setting it to 255 wherever the mask is true.
burnedImage = grayImage;
burnedImage(binaryImage) = 255;
% Display the image with the mask "burned in."
subplot(2, 4, 3);
imshow(burnedImage);
axis on;
caption = sprintf('Masked white inside region');
title(caption, 'FontSize', fontSize);

% Burn region as black into image by setting it to 255 wherever the mask is true.
burnedImage = grayImage;
burnedImage(binaryImage) = 0;
% Display the image with the mask "burned in."
subplot(2, 4, 4);
imshow(burnedImage);
axis on;
caption = sprintf('Masked black inside region');
title(caption, 'FontSize', fontSize);

% Mask the image white outside the mask, and display it.
% Will keep only the part of the image that's inside the mask, white outside mask.
whiteMaskedImage = grayImage;
whiteMaskedImage(~binaryImage) = 255;
subplot(2, 4, 5);
imshow(whiteMaskedImage);
axis on;
title('Masked white outside region', 'FontSize', fontSize);

% Mask the image outside the mask, and display it.
% Will keep only the part of the image that's inside the mask, zero outside mask.
blackMaskedImage = grayImage;
blackMaskedImage2 = grayImage;
blackMaskedImage(~binaryImage) = 0;
blackMaskedImage2(~binaryImage2) = 0;
subplot(2, 4, 6);
imshow(blackMaskedImage);
axis on;
title('Masked black outside region', 'FontSize', fontSize);
% Calculate the means for both lesion and sound
meanGL = mean(blackMaskedImage(binaryImage));
sdGL = std(double(blackMaskedImage(binaryImage)));
meanGL2 = mean(blackMaskedImage2(binaryImage2));
sdGL2 = mean(blackMaskedImage2(binaryImage2));

% Calculate contrast
ref_contrast = (meanGL-meanGL2)/meanGL;
trans_contrast = (meanGL2-meanGL)/meanGL2;

% Put up crosses at the centroid and center of mass.
hold on;
plot(centroid(1), centroid(2), 'r+', 'MarkerSize', 30, 'LineWidth', 2);
plot(centerOfMass(1), centerOfMass(2), 'g+', 'MarkerSize', 20, 'LineWidth', 2);

% Now crop the image.
leftColumn = min(x);
rightColumn = max(x);
topLine = min(y);
bottomLine = max(y);
width = rightColumn - leftColumn + 1;
height = bottomLine - topLine + 1;
croppedImage = imcrop(blackMaskedImage, [leftColumn, topLine, width, height]);
% Display cropped image.
subplot(2, 4, 7:8);
imshow(croppedImage);
axis on;
title('Cropped image', 'FontSize', fontSize);

% Calculate lesion circularity
circularity = (perimeter .^2) ./(4*pi*area);

% Put up crosses at the centroid and center of mass.
hold on;
plot(centroid(1)-leftColumn, centroid(2)-topLine, 'r+', 'MarkerSize', 30, 'LineWidth', 2);
% text(centroid(1)-leftColumn + 20, centroid(2)-topLine-20, 'Centroid', 'Color', 'r');
plot(centerOfMass(1)-leftColumn, centerOfMass(2)-topLine, 'g+', 'MarkerSize', 20, 'LineWidth', 2);
% text(centroid(1)-leftColumn + 20, centroid(2)-topLine+20, 'Weighted Centroid', 'Color', 'g');

% Report results.
message = sprintf('Ref Contrast = %.3f\nTrans Contrast = %.3f\nCircularity = %.3f\nArea in pixels = %.2f\nperimeter = %.2f\nCentroid at (x,y) = (%.1f, %.1f)\nCenter of Mass at (x,y) = (%.1f, %.1f)\nRed crosshairs at centroid.\nGreen crosshairs at center of mass.', ...
ref_contrast, trans_contrast, circularity, numberOfPixels2, perimeter, ...
centroid(1), centroid(2), centerOfMass(1), centerOfMass(2));
msgbox(message);
