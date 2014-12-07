L = 41; % Filter length
wc = 0.25 * pi; % Center frequency
n = 0:L-1;
ww = 0:pi/10000:pi; % Omega hat
hh = (0.54 - 0.46 * cos(2 * pi * n / (L - 1))) .* cos(wc * (n - (L - 1) / 2));
HH = freqz(hh, 1, ww);
figure(1)
subplot(211)
plot(ww, abs(HH));
title('Magnitude Response of BPF')
xlabel('Omega')
ylabel('Magnitude')
subplot(212)
plot(ww, angle(HH));
title('Phase Response of BPF')
xlabel('Omega');
ylabel('Phase');

trace = struct(...
  'x', ww, ...
  'y', abs(HH));

data = {trace};

layout = struct(...
    'xaxis', struct('title', '$\hat{\omega}$'), ...
    'yaxis', struct('title', '$\phi(\omega)$'));
response = plotly(trace, struct('layout', layout, 'filename', 'latex', 'fileopt', 'overwrite'));
