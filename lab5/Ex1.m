%name: Zhimingyuan Liu
%description:
%this assignment reads four sound files and using ASDR, ADDITION, AND TIME
%SCALE TO MAKE THE SOUND EFFECT

clear all;
close all;

% READ THE FOUR SOUND FILES
[y1, Fs1] = audioread('water.wav');
[y2, Fs2] = audioread('scream.wav');
[y3, Fs3] = audioread('saw.wav');
[y4, Fs4] = audioread('Blood.wav');

% TRANSPOSE TO ROW VECTOR 
y11 = y1';
y22 = y2';
y33 = y3';
y44 = y4';

% EXTRACT FIRST ROW INFORMATION
yWater = y11(1,:);


yScream_female = y22(1,:);
ySaw = y33(1,:);
yBlood = y44(1,:);

% SHORTEN THE SIGNAL TO 1000000 UNTIS
yWater_short = yWater(1:1000000);

% USING TIME SCALE TO CHANGE THE VOICE FROM FEMALE TO MALE
yScream_male = timescale(yScream_female, Fs1, 0.6);
yScream_male_short= yScream_male(1:300000);
ySaw_short = ySaw(1:200000);
yBlood_short = yBlood(1:180000);

% ADD ZERO VECTOR TO MATCH OTHER SIGNALS 
yBlood_new = [zeros(1,20000),yBlood_short];

% ADD THE SIGNAL TOGETHER
yBloodSaw = yBlood_new+ySaw_short;

yBloodSaw_long = [zeros(1,100000),yBloodSaw];
y_scare = yScream_male_short + yBloodSaw_long;


y_scarelong = [zeros(1,300000),y_scare,zeros(1,400000)];

% USING ASDR TO CHANGE THE MAGNITUDE OF SOUND 
yWater_short_asdr = ADSR(yWater_short);

% COMBINE ALL THE SIGNALS TOGETHER 
ytotal = yWater_short_asdr+y_scarelong;


% MAKE THE SOUND 
sound(ytotal, Fs1);

%SAVE THE SOUND FILE 
audiowrite ('the movie saw.wav', ytotal, Fs1);


