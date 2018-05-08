clear all; close all;
Fs = 8000;
Ts = 1/8000;
n1 = 0:(1):(0.5/Ts);
n2 = 0:(1):(1/Ts);
n4 = 0:(1):(2/Ts);


A2 = cos(440*pi*n2*Ts);
A1 = cos(440*pi*n1*Ts);
E1 = cos(220*2^(7/12)*2*pi*n1*Ts);
B1 = cos(220*2^(2/12)*2*pi*n1*Ts);
C1 = cos(220*2^(3/12)*2*pi*n1*Ts);



A1 = ADSR(A1);
A2 = ADSR(A2);
E1 = ADSR(E1);
B1 = ADSR(B1);
C1 = ADSR(C1);
y = [A1,B1,C1,E1,C1,B1,A2];
sound(y,Fs);
pause(5);

x = zeros(1,4000);
ex_0 = [A1,zeros(1,8001+6*4001)];
ex_1 = [zeros(1,3001),B1,zeros(1,8001+5*4001+1000)];
ex_2 = [zeros(1,3001*2),C1,zeros(1,8001+4*4001+2000)];
ex_3 = [zeros(1,3001*3),C1,zeros(1,8001+3*4001+3000)];
ex_4 = [zeros(1,3001*4),E1,zeros(1,8001+2*4001+4000)];
ex_5 = [zeros(1,3001*5),C1,zeros(1,8001+4001+5000)];
ex_6 = [zeros(1,3001*6),B1,zeros(1,8001+6000)];
ex_7 = [zeros(1,3001*7),A2,zeros(1,7000)];

y_sum = ex_0+ex_1+ex_2+ex_3+ex_4+ex_5+ex_6+ex_7;


sound(y_sum,Fs);