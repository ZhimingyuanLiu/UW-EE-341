% File name: Ex 2
% Name : Zhimingyuan Liu
% Description: design Finite Impulse Response Digital Filters and Infinite
% Impulse Response Digital Filters
clear all;
close all;

% finite Impulse Response 
y = fir1(10, 0.3);

% Infinite Impulse Response Digital Filters
Yb = butter(10, 0.3);

%plot FIR
figure(1);
freqz(y,1);
title('FIR');

%IIR
figure(2);
freqz(Yb,1);
title('IIR');

%APPLY the filter with impluse signal to get impluse reponse.
a =[1,zeros(1,length(y)-1)];
h1 = filter(y,1, [1,zeros(1,length(y))]);
h2 = filter(Yb,1,[1,zeros(1,length(Yb))]);

% get length of h1 and h2
n1 = (0:1:length(h1)-1);
n2 = (0:1:length(h2)-1);

% plot FIR 
figure(3);
subplot(1,2,1);
plot(n1,h1);
title('FIR IMPULSE RESPONSE');

%plot IIR 
subplot(1,2,2);
plot(n2,h2);
title('IIR IMPULSE REPONSE');

% apply filter to music file and stock txt and pulse signal
[data2,Fs] = audioread('music.wav');    
data = load('microsoftstock.txt');

stock1 = filter(y,1,data);
nstock1 =(0:1:length(stock1)-1);

stock2 = filter(Yb,1,data);
nstock2 =(0:1:length(stock2)-1);

x = zeros(60,1);                    % create pulse signal
x(1:20) = 1; 

input1 = filter(y,1,x);
ninput1 = (0:1:length(input1)-1);
input2 = filter(Yb,1,x);
ninput2 = (0:1:length(input2)-1);

music1 = filter(y,1,data2);       % apply FIR to music
music2 = filter(Yb,1,data2); 
% plot the time-domain filter stock market and phase signals

sound(music2,Fs);

% plot the Microsoft Stock FIR
figure(4);
subplot(2,1,1);
plot(nstock1, stock1);
title('Micrsoft Stock FIR');

subplot(2,1,2);
plot(nstock2, stock2);
title('Microsoft Stock IIR');

% Plot the Impulse IRR
figure(5);
subplot(2,1,1);
plot(ninput1,input1);
title('pulse signal FIR');
subplot(2,1,2);
plot(ninput2,input2);
title('pulse signal IIR');

