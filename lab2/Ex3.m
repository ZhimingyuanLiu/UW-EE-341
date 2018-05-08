clear all; close all;

figure();
subplot(1,3,1);
X = imread('egg_g.jpg');
imshow(X);


subplot(1,3,2);
X_basicscale = scaleimage(X, 5);
imshow(X_basicscale);
imwrite(X_basicscale, 'assignment3_scale.jpg');


subplot(1,3,3);
X_averageScale = averageScale(X,5);
imshow(X_averageScale);
imwrite(X_averageScale, 'assignment3_averageScale.jpg');

