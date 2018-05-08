clear all;close all;
X=imread('assignment3_averageScale.jpg');

[y1,y2] = imagescaleExpand(X);
figure(1);

imshow(X);
imwrite(X, 'assignment4_scale.jpg');
figure(2);
imshow(y1);
imwrite(y1, 'assignment4_replication.jpg');
figure(3);
imshow(y2,[]);
imwrite(y2, 'assignment4_interpolation.jpg');