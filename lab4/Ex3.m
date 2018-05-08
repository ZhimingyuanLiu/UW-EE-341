%file name: EX3
% NAME: Zhimingyuan Liu
%discription:Establish ideal low pass filter, sinc low pass filter, 10th
% order FIR Low pass Filter. Then apply the filter to the flute sound.
clear all; close all;

n =0 :255;
H1_mag = [zeros( 1,108), ones(1,40), zeros(1,108)];
H1_ang = [linspace(0,pi,108),linspace(pi,-pi,40),linspace(-pi,0,108)];
H = H1_mag.*exp(H1_ang.*sqrt(-1));

H1 = ifft(H);
H2 =[zeros(1,216), ones(1,80),zeros(1,216)];
h2 = ifft(H2);

f = fir1(10,0.08);
delta = [1, zeros(1,255)];

hf = filter(f, 1 , delta);

X1 = sinc(0.15*(n-32));

figure(1);
subplot(3,1,1);
plot(n,X1);
title('hs[n] = x1[n]');
subplot(3,1,2);
plot(n,H1);
title('H1[n] = ifft(H1[k]');
subplot(3,1,3);
plot(n,hf);
title('hf[n]');


x1_abs = abs(fftshift(fft(X1,256)));
x1_ang = angle(fftshift(fft(X1,256)));
hf_abs = abs(fftshift(fft(hf,256)));
hf_ang = angle(fftshift(fft(hf,256)));

N = 256;
w = (-N/2:(N/2)-1)*1/N;

% Plot the filters' magnitude and phase
figure(2);
subplot(2,1,1);
plot(w,x1_abs);
title('hs[w] = x1[n] magnitude');
subplot(2,1,2);
plot(w,x1_ang);
title('hs[w] = x1[n] phase');

figure(3);
subplot(2,1,1);
plot(w,hf_abs);
title('hf[w] magnitude');
subplot(2,1,2);
plot(w,hf_ang);
title('hf[w] phase');

figure(4);
subplot(2,1,1);
plot(w,H1_mag);
title('H1[w] magnitude');
subplot(2,1,2);
plot(w,H1_ang);
title('H1[w] phase');

% read the flute sound 
[yh,Fs] = audioread('flute-short.wav');
y = yh.';

% Apply sinc and FIR filter to the sound
y1 = conv(y,X1,'same');
y2 = filter(f,1,y);

% Apply ideal filter to the sound
y_fft_3 = fftshift(fft(y,256));
y3_f = y_fft_3.*H;
y3 = ifft(ifftshift(y3_f));

% extract magnitude of the filtered signal
y_fft = log(abs(fftshift(fft(y,256))));
y1_fft = log(abs(fftshift(fft(y1,256))));
y2_fft = log(abs(fftshift(fft(y2,256))));
y3_fft = log(abs(y3_f));
N = 256;
w = (-N/2:(N/2)-1)*Fs/N;

% Plot the three filtered signals' magnitude
figure(5);
subplot(4,1,1);
plot(w,y_fft);
title('original');
subplot(4,1,2);
plot(w,y1_fft);
title('sinc filter');
subplot(4,1,3);
plot(w,y2_fft);
title('10th order FIR');
subplot(4,1,4);
plot(w,y3_fft);
xlim([-6000 6000]);
title('ideal filter');

audiowrite('flute_sinc.wav',y1,Fs);
audiowrite('flute_FIR.wav',y2,Fs);
audiowrite('flute_ideal.wav',y3,Fs);

