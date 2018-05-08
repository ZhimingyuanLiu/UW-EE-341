% FILE: Assignment4.m
% NAME: Jiachen Zou
% DESCRIPTION: Using time scaling to tranform tiger sound to cat. Then
% modify autobotic voice with the same method.
% Clear all variables and close all windows
clear all;
close all;
% Read the tiger sound signal
[y,Fs] = audioread('tiger.wav');
% Speed up the signal by 5
[y1,t1] = timescale(y,Fs,5);
% Read the quote from Heroes
[y2,Fs2] = audioread('autobots-2.wav');
% Speed up the signal by 1.4
[y3,t3] = timescale(y2,Fs2,1.4);
% play the after-effect tiger sound
sound(y1,Fs);
pause(2);
sound(y3,Fs);
% Save the audio files
audiowrite('assignment4_cat.wav',y1,Fs);
audiowrite('assignment4_heroes.wav',y3,Fs2);
