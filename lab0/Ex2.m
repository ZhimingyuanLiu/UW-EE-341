% FILE: Assignment2.m
% NAME: ZHIMINGYUAN LIU
% DESCRIPTION: Plot the first 50 samples of cat.wav, both discrete one
% and
% continous one.
% Clear all variables and close all windows

clear all; close all;

% Load the cat.wav signal

[y, Fs] = audioread('cat.wav');
n = 0:(1):(length(y)-1);

% Extract the 50 samples and create the sample vector

y_s = y(1:50);
n_s = n(1:50);


% plot the signal

figure(1);

% discrete plot

subplot(2,1,1);
stem(n_s, y_s);
title('n vs. y');
xlabel('n');
ylabel('y');
ylim([-0.5,0.5]); 

% continuous plot
subplot(2,1,2);
plot(n_s, y_s);
title('t vs. y');
xlabel('t');
ylabel('y');
ylim([-0.5,0.5]);

sound(y,Fs);
