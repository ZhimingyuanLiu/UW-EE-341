clear all; close all;
f=0.15;
n=0:1:229;
X1 = sinc(f*(n-32));
X2 = sinc(f.*(n-32)).*(-1).^n;
X3 = sinc(f*(n-32)).*cos(2*pi*0.2*n);
w = (-230/2:230/2 -1)*(1/230);
Xabs1 = abs(fftshift(fft(X1)));
Xabs2 = abs(fftshift(fft(X2)));
Xabs3 = abs(fftshift(fft(X3)));
Xangle1 =angle(fftshift(fft(X1)));
Xangle2 =angle(fftshift(fft(X2)));
Xangle3 =angle(fftshift(fft(X3)));


figure(1);
subplot(2,1,1);
plot(w,Xabs1);
title('X1 fft');
subplot(2,1,2);
plot(w,Xangle1);
title('X1 phase');

figure(2);
subplot(2,1,1);
plot(w,Xabs2);
title('X2 fft');
subplot(2,1,2);
plot(w,Xangle2);
title('X2 phase');


figure(3)
subplot(2,1,1);
plot(w,Xabs3);
title('X3 fft');
subplot(2,1,2);
plot(w,Xangle3);
title('X3 phase');
