%FILE: Assignment1.m
%NAME: Zhimingyuan Liu
%DESCRIPTION: using the filter and convolution to change the signal
%then we use
clear all;
close all;

%load X
x = load('microsoftstock.txt');
n = (0:1:length(x)-1);

% define the filter
a =[30,zeros(1,29)];
b = ones(1,30);
y1 = filter(b,a,x);

% find the impulse function and convolve.
h = filter(b,a,[1,zeros(1,29)]);
y2 = conv(x,h,'same');

% plot
figure;
plot(n,x,'k');
title('stock');
xlim([30,1200]);
xlabel('time')
ylim([20,35]);
ylabel('stock price');


hold on;
plot(n,y1,'r');
 
hold on;
plot(n, y2, 'b');

legend('orginal', 'Filiter','Convolve');

% first difference filter 
a1 = [1, zeros(1,29)]
b1 = [1,-1,zeros(1,28)];
y3 = filter(b1,a1,x);

figure(2);
plot(n,y3);
title('high frequency transform');

% plot magnitude and phase of filter
figure(3);
freqz(b,a);
title('Moving Average')

% plot magnitude and phase pf filter
figure(4);
freqz(b1,a1);
title('1st Difference');












