function sc = octavescore(xx, hh, fs)
%OCTAVESCORE
%   usage:      sc = octavescore(xx, hh, fs)
%   returns a score based on the max amplitude
%   of the filtered output
%   xx = input of the signal containing musical notes
%   hh = impulse response of ONE bandpass filter
%   fs = sampling rate
%
%   The signal detection is done by filtering xx
%   with a length-L BPF, hh, and then finding the
%   maximum amplitude of the output within 50
%   millisecond segments.
%   The score is a vector containing the maximum
%   amplitudes of all the segments.
yy = conv(xx, hh)

yy(1:round((length(hh)-1)/2)) = [];
M = round(fs*0.05)
L = length(yy)
N = floor(L/M)
sc = zeros(1,N)
for kk = 1:N
   sc(kk) = max( abs(yy(1+(kk-1)*M:kk*M)) );
end
