clear all; close all;
n = 0:1:127;
f = 0.25;
X1 = 1+cos(2*pi*0.5*n);
X2 = 1+cos(2*pi*0.25*n);
N = 128;
w = (-N/2:N/2 -1)*(1/N);

Xfft1 = fft(X1);
Xfft2 = fft(X2);

Xabs1 = abs(Xfft1);
Xabs2 = abs(Xfft2);

Xshift1 = fftshift(Xfft1)
Xshift2 = fftshift(Xfft2);

Xshiftabs1 = abs(Xshift1);
Xshiftabs2 = abs(Xshift2);

figure(1);
subplot(2,1,1);
stem(w,Xabs1);
title('f = 0.5 Xfft');
subplot(2,1,2);
stem(w,Xshiftabs1);
title('f = 0.5 Xfftshift');

figure(2);
subplot(2,1,1);
stem(w,Xabs2);
title(' f= 0.25 Xfft');
subplot(2,1,2);
stem(w,Xshiftabs2);
title(' f = 0.5 Xfftshift');


n1 = 0:1:31;
n3 = 0:1:522;
X1 = 1+cos(2*pi*0.26*n1);
X2 = 1+cos(2*pi*0.26*n);
X3 = 1+cos(2*pi*0.26*n3);
Xshift1 = fftshift(fft(X1));
Xshift2 = fftshift(fft(X2));
Xshift3 = fftshift(fft(X3));

X3abs1 = abs(Xshift1);
X3abs2 = abs(Xshift2);
X3abs3 = abs(Xshift3);

figure(3);
subplot(3,1,1);
stem(X3abs1);
title('f = 0.26 N = 32');
subplot(3,1,2);
stem(X3abs2);
title('f = 0.26 N = 128');
subplot(3,1,3);
stem(X3abs3);
title('f = 0.26 N = 512');

Xoriginal_512 = abs(fftshift(fft(X2,512)));
figure(4)
stem(Xoriginal_512);
title('128 N signal with magnitude 512');

[Y, Fs] = audioread('flute-short.wav');
Yfft = log(abs(fftshift(fft(Y))));
wy = (-length(Y)/2:length(Y)/2 -1)*(Fs/(length(Y)));
figure(5);
stem(wy,Yfft);
title('audioread signal');




