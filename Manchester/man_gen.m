function [output_sequence] = man_gen(input_sequence, pad_bits)
    % Generate an array of bits that emulate manchester protocol
    %   input_sequence: the equvalent NRZ data
    %   pad_bits: how many values of consective '0's or '1's
    
    bit_sequence = [];
    
    padded_zeros = zeros(1, pad_bits);
    padded_ones = ones(1, pad_bits);
    
    for bit = input_sequence
        if bit == 1
            man_bit = [padded_zeros, padded_ones];
        else
            man_bit = [padded_ones, padded_zeros];
        end
        bit_sequence = [bit_sequence, man_bit];
    end
    output_sequence = bit_sequence;
end

