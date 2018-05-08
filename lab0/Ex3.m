% FILE: Assignment3.m
% NAME: Zhimingyuan Liu
% DESCRIPTION: Create a three consecutive meows signal with different
% loudness and short pauses between them. And plot the wave.
% Clear all variables and close all windows
clear all;
close all;
% load the original meow signal
[y,Fs] = audioread('cat.wav');
% Intialize the scaled signals for loud levels
y_1 = y*0.5;
y_2 = y*0.25;
% Initialize the pause vector with zero
s = zeros(0.5*Fs,1);
% Concatenate the signals
full = [y;s;y_1;s;y_2];
% play the sound
sound(full,Fs);
% Save the waveform
audiowrite('assignment3.wav',full,Fs);
% Create the sampling vector
n = 0:(length(full)-1);
% Plot the waveform
figure;
% Discrete plot
subplot(2,1,1);
stem(n,full);
title('3 Meows signal discrete');
xlabel('n');
ylabel('y');
% Continuous plot
subplot(2,1,2);
plot(n,full);
title('3 Meows signal continuous');
xlabel('t');
ylabel('y');
