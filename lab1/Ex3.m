% FILE: Assignment3.m
% NAME: Zhimingyuan Liu
% DESCRIPTION: Create noise of ocean from random noise signal. Then
% modify it
% with decay effect.
% Clear all variables and close all windows
clear all; close all;
Fs = 8000;
ocean = randn(1, 10001);

% Initialize the random noise signal
t = 0:1/Fs:(10000/Fs);
y = cos(2*pi*1000*t);

% Produce the 500 frequency noise signal
y1 = ocean.*y;

sound(y1, Fs);
pause(5);

% Produce the decay version
y2 =0.2*exp(-2*t).*cos(2*pi*1000*t);
y3 = ocean.*y2;

sound(y3,Fs);
% Save the audio file
audiowrite('Assignment3.wav', y3,Fs);