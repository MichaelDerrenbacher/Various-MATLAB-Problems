function [output_sequence] = clk_gen(cycles, pad_bits, clock_phase)
    % Generate an array of bits that emulate a clock source
    %   cycles: how many periods of the clock to generate
    %   pad_bits: how many values of consective '0's or '1's
    %   clock_phase: amount in degrees to shift the clock signal
    
    bit_sequence = [];
    
    padded_zeros = zeros(1, pad_bits);
    padded_ones = ones(1, pad_bits);
    
    for bit = 1:cycles*2
        if mod(bit, 2) == 1
            bit_sequence = [bit_sequence, padded_ones];
        else
            bit_sequence = [bit_sequence, padded_zeros];
        end
    end
    
    bit_sequence = circshift(bit_sequence, round(pad_bits * clock_phase/180));
    
    output_sequence = bit_sequence;
end

