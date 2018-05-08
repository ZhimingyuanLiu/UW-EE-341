clear all;
data2 = audioread('music.wav');     % load music file
data = load('microsoftstock.txt'); % load stock data file;
FIR = fir1(10, 0.3);                % build FIR 
[B,A] = butter(10, 0.3);            % build IIR 
x = zeros(60,1);                    % create pulse signal
x(1:20) = 1;                      
frevalz01(FIR,1);                   % create plot of FIR
figure;
frevalz01(B,A);                     % create plot of IIR
stock1 = filter(FIR,1,data);        % apply FIR to stock
stock2 = filter(B,A,data);          % apply IIR to stock
impulse1 = filter(FIR,1,x);         % apply FIR to impulse
impulse2 = filter(B,A,x);           % apply IIR to impulse
music1 = filter(FIR,1,data2);       % apply FIR to music
music2 = filter(B,A,data2);         % apply IIR to music
figure;
subplot(2,1,1);
plot(stock1);                       % create time plot of stock with FIR 
title('FIR for stock');
subplot(2,1,2);
plot(stock2);                       % create time plot of stock with IIR 
title('IIR for stock');
figure;
subplot(2,1,1);
plot(impulse1);                     % create time plot of impulse with FIR 
title('FIR for impulse');
subplot(2,1,2)      
plot(impulse2);                     % create time plot of impulse with IIR 
title('IIR for impulse');







