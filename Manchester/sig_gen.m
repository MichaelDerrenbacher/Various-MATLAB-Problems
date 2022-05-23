function [man, clk0, clk90, clk180, clk270] = sig_gen(data, data_freq, clock_freq, clock_phase_adjust)
    % Generate manchester and clock bit sequence based on an input data
    % pattern and data/clock frequencies 
    %   data: the equvalent NRZ data
    %   data_freq: frequency of the output manchester data (fix at 1)
    %   clock_freq: frequency of the output clock (scale from 1)
    %   clock_phase_adjust: clock offset phase (referenced from data)
    
    
    pad_bits = freq_to_pad_bits(data_freq);
    man = man_gen(data, pad_bits);
    
    % if clock freqency faster than data frequency, run more clock cycles
    % to make clock signal have more datapoints than data signal
    cycles = length(data);
    if clock_freq > data_freq
        cycles = ceil(length(data) * clock_freq / data_freq);
    end
    
    pad_bits = freq_to_pad_bits(clock_freq);
    clk0_data = clk_gen(cycles, pad_bits, 0 + clock_phase_adjust);
    clk90_data = clk_gen(cycles, pad_bits, 90 + clock_phase_adjust);
    clk180_data = clk_gen(cycles, pad_bits, 180 + clock_phase_adjust);
    clk270_data = clk_gen(cycles, pad_bits, 270 + clock_phase_adjust);
    
    % trim clock data to match manchester data length
    clk0 = clk0_data(1:length(man));
    clk90 = clk90_data(1:length(man));
    clk180 = clk180_data(1:length(man));
    clk270 = clk270_data(1:length(man));

end

