function [pad_bits] = freq_to_pad_bits(freq)
    % Convert a frequency to a bit padding
    
    % multiply pad_bits by about 1000 to get sharp edges for signals
    pad_bits = round((1/freq) * 1E3);

end

