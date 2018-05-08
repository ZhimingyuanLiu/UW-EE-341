% FILE: Assignment1.m
% NAME: Zhimingyuan Liu
% DESCRIPTION: Manually create a 5 second cos signal with 200Hz
% frequency
% and 8kHz samling rate, both discrete one and continous one.
% Clear all variables and close all windows 
clear all;
close all;
% Initialize the time and sample vector
Fs = 8000;
Ts = 1/8000;
n = 0:(1):(5/Ts); % Continous time vector

% Create the discrete and continous vectors
x = cos(400*pi*n*Ts);

% Extract the first 50 sample of both signal
x_s = x(1:50);
n_s = n(1:50);


% plot the 50 sample
figure(1);
subplot(2,1,1);
stem(n_s, x_s);
title('n vs. x');
xlabel('n');
ylabel('x');
ylim([-2,2]); 

subplot(2,1,2);
plot(n_s, x_s);
title('t vs. x');
xlabel('t');
ylabel('x');
ylim([-2,2]);

sound(x,Fs);

% Save the signals in wav format
audiowrite('assignment 1.wav',x,Fs);
