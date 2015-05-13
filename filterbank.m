function hh = filterbank(octavenumber, fs)

ww = 2*pi*50/fs:pi/1000:2*pi*2000/fs;
octavenumbers = 2:6;
wc = octavecenterfreqrad(octavenumbers,fs);
octavepassbandwidth = octavepbw(octavenumbers, fs);
octaveL = 0;

for Length = 1:500
    pbw_L = pbw(Length, ww, wc(octavenumber-1), fs);
    octaveL = Length;
    if (pbw_L <= octavepassbandwidth(octavenumber-1))
        break
    end        
end
    
n=0:octaveL-1;

unscaledhh = (.54 - .46*cos(2*pi*n/(octaveL-1))).*cos(wc(octavenumber-1) *(n-(octaveL-1)/2));
HH = freqz(unscaledhh, 1, ww);
magHH = abs(HH);
peakvalue = max(magHH); % Beta value is 1/peakvalue
hh = unscaledhh/peakvalue;

end
