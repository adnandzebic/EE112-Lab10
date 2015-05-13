fs = 8000; % Sampling rate

% Generates all the filters that are needed for filtering
hh2 = filterbank(2, fs);
hh3 = filterbank(3, fs);
hh4 = filterbank(4, fs);
hh5 = filterbank(5, fs);
hh6 = filterbank(6, fs);

duration = 0.25; % Split the signal up into 3 regions of 0.25 secs
tt = 0:1/fs:duration; % Time vector
xx1 = cos(2 * pi * 220 * tt); % Input signal for first 0.25 secs
xx2 = cos(2 * pi * 880 * tt); % Input signal for the next 0.25 secs
xx3 = cos(2 * pi * 440 * tt) + cos(2 * pi * 1760 * tt); % Next 0.25 secs

% Creates the output signals
yy2 = conv(xx3, hh2);
yy3 = conv(xx3, hh3);
yy4 = conv(xx3, hh4);
yy5 = conv(xx3, hh5);
yy6 = conv(xx3, hh6);

% Discrete Time 
nn2 = 1:length(yy2);
nn3 = 1:length(yy3);
nn4 = 1:length(yy4);
nn5 = 1:length(yy5);
nn6 = 1:length(yy6);

% Discrete Time Plots
figure(1)
title('Output Signals')
subplot(5, 1, 1)
stem(yy2, nn2);
xlabel('Discrete Time [n]')
ylabel('yy2[n]')
subplot(5, 1, 2)
stem(yy3, nn3, 'r');
xlabel('Discrete Time [n]')
ylabel('yy3[n]')
subplot(5, 1, 3)
stem(yy4, nn4, 'g');
xlabel('Discrete Time [n]')
ylabel('yy4[n]')
subplot(5, 1, 4)
stem(yy5, nn5, 'y');
xlabel('Discrete Time [n]')
ylabel('yy5[n]')
subplot(5, 1, 5)
stem(yy6, nn6, 'b');
xlabel('Discrete Time [n]')
ylabel('yy6[n]')

% Frequency Plots
close all;
ww = 0:pi/10000:2 * pi * 2000 / fs; % From 0 to 2000 Hz @ fs

% Send all the output signals to frequency domain
HH2 = freqz(yy2, 1, ww);
HH3 = freqz(yy3, 1, ww);
HH4 = freqz(yy4, 1, ww);
HH5 = freqz(yy5, 1, ww);
HH6 = freqz(yy6, 1, ww);

% Plot the frequency magnitude
figure(1)
title('Output Signals')
subplot(5, 1, 1)
plot(ww, abs(HH2));
xlabel('Discrete Time [n]')
ylabel('yy2[n]')
subplot(5, 1, 2)
plot(ww, abs(HH3));
xlabel('Discrete Time [n]')
ylabel('yy3[n]')
subplot(5, 1, 3)
plot(ww, abs(HH4));
xlabel('Discrete Time [n]')
ylabel('yy4[n]')
subplot(5, 1, 4)
plot(ww, abs(HH5));
xlabel('Discrete Time [n]')
ylabel('yy5[n]')
subplot(5, 1, 5)
plot(ww, abs(HH6));
xlabel('Discrete Time [n]')
ylabel('yy6[n]')
