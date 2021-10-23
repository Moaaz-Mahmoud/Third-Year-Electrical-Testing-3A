imshow(b);
imgbi = imbinarize(img);

img = imread('coins.png');

% use this fun to find circles after make the image black and white.
[centers,radii] = imfindcircles(imgbi,[40 90]);

%
h = viscircles(centers,radii);
length(centers);