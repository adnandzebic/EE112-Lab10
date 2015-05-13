function bk = octavedesign(wc, L)

n = 0:L-1;
bk = [];
for k = 1:length(wc)
    bknew = (.54 - .46*cos(2*pi*n/(L-1))).*cos(wc(k)*(n-(L-1)/2));
    bk = [bk ; bknew];
end
