clear all; close all;


X=imread('photo.jpg');
X_gray = rgb2gray(X);
Xd = double(X_gray);
hs = (1/25)*[1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1;1 1 1 1 1;1 1 1 1 1];
y = conv2(Xd,hs,'same');

yp = uint8(y);




h1 = [-1 0 1; -2 0 2; -1 0 1];
h2 = [1 2 1; 0 0 0; -1 -2 -1];

m1 = conv2(Xd, h1, 'same');
m2 = conv2(Xd, h2, 'same');

m1_m = (m1.^2).^(1/2);
m2_m = (m2.^2).^(1/2);
m_total = (m1.^2+m2.^2).^(1/2);

m1_m = uint8(m1_m);
m2_m = uint8(m2_m);
m_total = uint8(m_total);

figure(1);
imshow(yp);
imwrite(yp, 'assignment1_blur.jpg');

figure(2);
imshow(m1_m);
imwrite(m1_m, 'assignment1_verti.jpg');

figure(3);
imshow(m2_m);
imwrite(m2_m, 'assignment1_hori.jpg');

figure(4);
imshow(m_total);
imwrite(m_total, 'assignment1_edge_total.jpg');



