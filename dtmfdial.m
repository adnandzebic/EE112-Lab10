function xx = dtmfdial(keyNames, fs)
    dtmf.keys = ...
        ['1', '2', '3', 'A';
         '4', '5', '6', 'B';
         '7', '8', '9', 'C';
         '*', '0', '#', 'D'];

    dtmf.colTones = ones(4,1) * [1209, 1336, 1477, 1633];
    dtmf.rowTones = [697; 770; 852; 941] * ones(1,4);

duration = 0.20; % The time duration of each tone pair
silence = 0.05; % The time duration of silence
tt = 0:1/fs:duration; % Useful time vector

xx = 0; % Instantiating the output vector
for kk = 1:length(keyNames) % for each given keyname
    keyName = keyNames(kk);
    
    [ii,kk] = find(dtmf.keys==keyName); % Determines row and column for the key
    
    xx1 = cos(2 * pi * dtmf.rowTones(ii,kk) * tt); % The corresponding column row tone
    xx2 = cos(2*pi * dtmf.colTones(ii,kk) * tt); % The row tone with a 20 second duration

    xx = [xx, zeros(1, duration * fs), xx1 + xx2]; %  Concatenate the sum and silence
end
