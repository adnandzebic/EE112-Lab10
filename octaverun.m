function octaves = octaverun(xx, fs)
%OCTAVERUN    octaves = octaverun(xx, fs)
%   Returns a 5 x N matrix consisting of ones and zeros where
%   N is the number of 50 millisecond intervals. The first row
%   corresponds to octave 2, the second row corresponds to
%   octave 3, and so forth up to octave 6 on row 5.
%
%        octaves = matrix of octave occurrences
%             xx = input signal
%             fs = sampling rate
%
%
% Names: Adnan Dzebic (009881144)
ww = 0:pi/10000:2*pi*2000/fs; % Omega hat
octavenumbers = 2:6;
wc = octavecenterfreqrad(octavenumbers, fs); % Determines the
%                                          center frequencies
%                                          and stores them in
%                                          a vector
octavepassbandwidth = octavepbw(octavenumbers, fs); % Calculates
%                                          the required passband
%                                          widths for each octave
%
% The code below calculates the optimal filter length corresponding
% to each octave
octaveL = []; % Where the list of filter lengths will be stored

for ii = 1:length(octavepassbandwidth)
    for Length = 1:500
        pbw_L = pbw(Length, ww, wc(ii), fs);
        octaveL(ii) = Length;
        if (pbw_L <= octavepassbandwidth(ii))
            break
        end
    end
end

% temp1 and temp2 are only used for calculating the size of
% the octaves matrix
temp1 = octavedesign(wc(1), octaveL(1));
temp2 = octavescore(xx, temp1, fs);
octaves = ones(5, length(temp2)); % Initializing octaves matrix
clear temp1 temp2;

% Fills the octaves matrix with the scores data
for ii = 1:length(octavenumbers)
    hh = octavedesign(wc(ii), octaveL(ii));
    octaves(ii, :) = octavescore(xx, hh, fs);
end

threshold = max(octaves); % Used for comparing and determining a score

for ii = 1:length(octaves)
    for kk = 1:5
        if octaves(kk, ii) == threshold(ii)
            octaves(kk, ii) = 1;
        else
            octaves(kk, ii) = 0;
        end
    end
end
