function result = pbw(L, ww, wc, fs)

n = 0:L-1;
hh = (.54 - .46*cos(2*pi*n/(L-1))).*cos(wc *(n-(L-1)/2));
HH = freqz(hh, 1, ww);
magHH = abs(HH);
peakvalue = max(magHH); % Beta value is 1/peakvalue
scaledHH = magHH/peakvalue;
passbandHH = find(scaledHH > 0.5);
upperfreq = max(passbandHH);
lowerfreq = min(passbandHH);
result = ww(upperfreq) - ww(lowerfreq);

end