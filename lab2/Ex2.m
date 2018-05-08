clear all; close all;
X=imread('egg_g.jpg');


Xlr = fliplr(X)
X2up = flipud(X)
X3mirror = fliplr(flipud(X));


figure(1);
imshow(Xlr);
imwrite(Xlr, 'assignment2_LRflip.jpg');

figure(2);
imshow(X2up);
imwrite(X2up, 'assignment2_UPflip.jpg');

figure(3);
imshow(X3mirror);
imwrite(X3mirror, 'assignment2_MirrorFlip.jpg');
