L = 41; % Filter length
wc = 0.25 * pi; % Center frequency
n = 0:L-1;
ww = 0:pi/10000:pi; % Omega hat
hh = (0.54 - 0.46 * cos(2 * pi * n / (L - 1))) ...
                    .* cos(wc * (n - (L - 1) / 2));
HH = freqz(hh, 1, ww);
MagnitudeOfHH = abs(HH);
PhaseOfHH = angle(HH);

% ===================== PLOT ===================== %
subplot(211)
plot(ww, MagnitudeOfHH);
title('Frequency Response Magnitude of BPF');
xlabel('Omega');
ylabel('Magnitude');
subplot(212)
plot(ww, PhaseOfHH, 'r');
title('Frequency Response Phase of BPF')
xlabel('Omega');
ylabel('Phase');

% ================ TABLE SUMMARY ================= %
data = zeros(6,3);

Magnitude1 = MagnitudeOfHH(find(ww == 0));
Phase1 = PhaseOfHH(find(ww == 0));
data(1, 1) = 0;
data(1, 2) = Magnitude1;
data(1, 3) = Phase1;

Magnitude2 = MagnitudeOfHH(find(ww == 0.1 * pi));
Phase2 = PhaseOfHH(find(ww == 0.1 * pi));
data(2, 1) = 0.1 * pi;
data(2, 2) = Magnitude2;
data(2, 3) = Phase2;

Magnitude3 = MagnitudeOfHH(find(ww == 0.25 * pi));
Phase3 = PhaseOfHH(find(ww == 0.25 * pi));
data(3, 1) = 0.25 * pi;
data(3, 2) = Magnitude3;
data(3, 3) = Phase3;

Magnitude4 = MagnitudeOfHH(find(ww == 0.4 * pi));
Phase4 = PhaseOfHH(find(ww == 0.4 * pi));
data(4, 1) = 0.4 * pi;
data(4, 2) = Magnitude4;
data(4, 3) = Phase4;

Magnitude5 = MagnitudeOfHH(find(ww == 0.5 * pi));
Phase5 = PhaseOfHH(find(ww == 0.5 * pi));
data(5, 1) = 0.5 * pi;
data(5, 2) = Magnitude5;
data(5, 3) = Phase5;

Magnitude6 = MagnitudeOfHH(find(ww == 0.75 * pi));
Phase6 = PhaseOfHH(find(ww == 0.75 * pi));
data(6, 1) = 0.75 * pi;
data(6, 2) = Magnitude6;
data(6, 3) = Phase6;

disp('     Omega   Magnitude  Phase')
disp(data)

% =============================================== %
%     Omega   Magnitude  Phase
%         0    0.0800    3.1416
%    0.3142    0.0800   -3.1416
%    0.7854   10.8800    3.1416
%    1.2566    0.0800   -3.1416
%    1.5708    0.0800   -3.1416
%    2.3562    0.0800   -3.1416
