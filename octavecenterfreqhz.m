function fc = octavecenterfreqhz(octave)
    A4 = 440; % This is the reference frequency
    C4 = A4 * 2^(-9/12); % This is the first frequency in the 4th octave
    B4 = A4 * 2^(1/12); % This is the last frequency in the 4th octave
    
    lowerfreq = C4 * 2^(octave-4);
    upperfreq = B4 * 2^(octave-4);
    
    fc = (lowerfreq + upperfreq)/2;
end