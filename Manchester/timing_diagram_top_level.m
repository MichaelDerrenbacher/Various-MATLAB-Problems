%% Generate Data and 4-phase clk timing diagram
clc
clear

% PRBS3 Pattern
data = [1,0,1,1,1,0,0];

data_freq = 1;
clock_freq = 1;
clock_phase_adjust = 0; 

[manch_data, clk0, clk90, clk180, clk270] = sig_gen(data, ...
                                                    data_freq, ... 
                                                    clock_freq, ...
                                                    clock_phase_adjust);
signal_array = [manch_data; clk0; clk90; clk180; clk270];
signal_names = ["Data"; "Clk0"; "Clk90"; "Clk180"; "Clk270"];
signal_colors = ["Black"; "Blue"; "Blue"; "Blue"; "Blue"];

plot_signals(signal_array, signal_names, signal_colors)


%% Generate Data, 4-phase clk, and bit-wise data/clock timing diagram
clc
clear

% PRBS3 Pattern
data = [1,0,1,1,1,0,0];

data_freq = 1;
clock_freq = 1;
clock_phase_adjust = 0; 

[manch_data, clk0, clk90, clk180, clk270] = sig_gen(data, ...
                                                    data_freq, ... 
                                                    clock_freq, ...
                                                    clock_phase_adjust);


signal_array = [manch_data; 
                clk0; 
                clk90; 
                clk180; 
                clk270; 
                (manch_data & clk0); 
                (manch_data & clk90); 
                (manch_data & clk180); 
                (manch_data & clk270)];
            
signal_names = ["Data"; 
                "Clk0"; 
                "Clk90"; 
                "Clk180"; 
                "Clk270"; 
                "Data & Clk0"; 
                "Data & Clk90"; 
                "Data & Clk180"; 
                "Data & Clk270"];
            
signal_colors = ["Black"; 
                 "Blue"; 
                 "Blue"; 
                 "Blue"; 
                 "Blue";
                 "Red";
                 "Red";
                 "Red";
                 "Red";];
            
plot_signals(signal_array, signal_names, signal_colors)

