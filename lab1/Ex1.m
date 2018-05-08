% FILE: Assignment1and2.m
% NAME: Zhimingyuan Liu
% DESCRIPTION: Create and synthesize the musical notes and
% concatenating
% into song signal. Apply sound effect of ASDR and overlap to imptove
% sound
% quaility to imitate instrumental sound
% Clear all variables and close all windows
clear all;
close all;
% Initialize the sample vector for differnt note lengths
Fs = 8000;
Ts = 1/Fs;
n_4 = 0:1:(0.5/Ts);
n_2 = 0:1:(1/Ts);
n = 0:1:(2/Ts);
% Produce the sound notes
A_2 = cos(2*pi*220*n_2*Ts);
A_4 = cos(2*pi*220*n_4*Ts);
E_4 = cos(2*pi*220*2^(7/12)*n_4*Ts);
B_4 = cos(2*pi*220*2^(2/12)*n_4*Ts);
C_4 = cos(2*pi*220*2^(3/12)*n_4*Ts);
A = cos(2*pi*220*n*Ts);
% Create space between notes
space = zeros(1,0.25*Fs);
% Synthesize song
song = [A_2,space,A_4,space,E_4,space,E_4,space,E_4,space,B_4,space,C_4,space,B_4,space,A];

% before EX1

% Modify each note to have ASDR effect
mod_A2 = ADSR(A_2);
mod_A4 = ADSR(A_4);
mod_E4 = ADSR(E_4);
mod_B4 = ADSR(B_4);
mod_C4 = ADSR(C_4);
mod_A = ADSR (A);
% Produce long signal for summation into final overlap song signal
ex_0 = [mod_A2,zeros(1,4001*7+16001)];
ex_1 = [zeros(1,7001),mod_A4,zeros(1,6*4001+17001)];
ex_2 = [zeros(1,6001+4001),mod_E4,zeros(1,5*4001+18001)];
ex_3 = [zeros(1,5001+4001*2),mod_E4,zeros(1,4*4001+19001)];
ex_4 = [zeros(1,4001+4001*3),mod_E4,zeros(1,3*4001+20001)];
ex_5 = [zeros(1,3001+4001*4),mod_B4,zeros(1,2*4001+21001)];
ex_6 = [zeros(1,2001+4001*5),mod_C4,zeros(1,1*4001+22001)];
ex_7 = [zeros(1,1001+4001*6),mod_B4,zeros(1,23001)];
ex_8 = [zeros(1,1+4001*7),mod_A,zeros(1,8000)];

% Summation the overlap song signal
mod_song = ex_0+ex_1+ex_2+ex_3+ex_4+ex_5+ex_6+ex_7+ex_8;
% Play the final signal
sound(mod_song,Fs);
% Save the audio files
audiowrite('assignment1.wav',song,Fs);
audiowrite('assignment2.wav',mod_song,Fs);


