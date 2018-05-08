
% TIMESCALE: Scale the input signal by the given factor in time
% USAGE: [y1, t1] = timescale(signal,Fs, factor);

function [y, t] = timescale(x, Fs, a)

    % Get numerator and denominator of scaling factor
    [n, d] = rat(a);
    
    % rescale the time axis
    y = resample(x, d, n);
    
    % Produce time samples vector
    t = (0:length(y)-1) * (1/Fs);

end