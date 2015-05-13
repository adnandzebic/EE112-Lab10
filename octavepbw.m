function result = octavepbw(octavenumbers, fs)
    result = [];
    for ii = 1:length(octavenumbers)
        A4 = 440; % This is the reference frequency
        C4 = A4 * 2^(-9/12); % This is the first frequency in the 4th octave
        B4 = A4 * 2^(1/12); % This is the last frequency in the 4th octave
    
        lowerfreq = C4 * 2^(octavenumbers(ii)-4);
        upperfreq = B4 * 2^(octavenumbers(ii)-4);
    
        result(ii) = (2 * pi * (upperfreq - lowerfreq))/fs;
    end
end