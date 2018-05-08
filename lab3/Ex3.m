%FILE: EX3
%NAME: ZHIMINGYUAN lIU
%DESCRIPTION: using equalizer to boost the vocal.
clear all;
close all;

% read sound file
[x,Fs] = audioread('music.wav');

%apply equalizer to sound 
y1 = equalizer(x,1,1,1,1);

%apply different value equalizer to sound
y2 = equalizer(x,0.5,8,8,0.5);

h1 = butter(4, 1/5);
h2 = butter(4, [1/5 2/5]);
h3 = butter(4, [2/5 2/3]);
h4 = butter(4, 2/3);

figure(1);
freqz(h1,1);
title(' low pass Freq Response')

figure(2);
freqz(h2,2);
title(' low band pass Freq Response');

figure(3);
freqz(h3,3);
title(' high band pass Freq Response');

figure(4);
freqz(h4,4);
title('high pass Butterworth');

sound(y2,Fs);
audiowrite('music_modified.wav',y2,Fs);