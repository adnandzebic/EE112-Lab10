ww = 0:pi/10000:2*pi*2000/fs;
octavenumbers = 2:6;
wc = octavecenterfreqrad(octavenumbers, fs);
octavepassbandwidth = octavepbw(octavenumbers, fs);
octaveL = [];

for ii = 1:length(octavepassbandwidth)
    for Length = 1:500
        pbw_L = pbw(Length, ww, wc(ii), fs);
        octaveL(ii) = Length;
        if (pbw_L <= octavepassbandwidth(ii))
            break
        end
    end
end

% Plot
for ii = 1:length(octavenumbers)
    hh = octavedesign(wc(ii), octaveL(ii));
    HH = freqz(hh, 1, ww);
    plot(ww, abs(HH))
    hold on;
end
