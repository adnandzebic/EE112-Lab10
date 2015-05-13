fs = 8000;
ww = 2*pi*50/fs:pi/1000:2*pi*2000/fs;
octavenumbers = 2:6;
wc = octavecenterfreqrad(octavenumbers,fs);
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