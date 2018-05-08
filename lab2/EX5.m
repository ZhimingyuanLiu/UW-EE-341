clear all; close all;
I = imread('photo.jpg');
X_gray = rgb2gray(I);
X_AS = averageScale(X_gray,2);
X_BS = scaleimage(X_gray,2);
[yn,ym] = imagescaleExpand(X_gray);


figure(1);
imshow(X_AS);
imwrite(X_AS, 'assignment5_shrunk.jpg');

figure(2);

imshow(ym,[]);
imwrite(ym, 'assignment5_enlarge.jpg');

