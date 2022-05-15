clc
clear

kn = 400E-6;
W = 2;
L = 1;

Vtn = 0.5;
lamda = 0.005;

V_DS_sweep = 0:0.001:10;
V_GS_sweep = 0:1:5;


I_D = zeros(length(V_DS_sweep), length(V_GS_sweep));


outer_loop = 1;
for V_GS = V_GS_sweep
    
    inner_loop = 1;
    for V_DS = V_DS_sweep
        
        V_overdrive = V_GS - Vtn;
        
        if V_overdrive <= 0  % Cut Off
            I_D_value = 0;
        else
            if V_DS <= V_overdrive  % Linear
                I_D_value = kn * W/L * (2 * (V_overdrive) * V_DS - V_DS^2)  * (1 + lamda * V_DS);
            else  % Saturation
                I_D_value = kn * W/L * (V_overdrive)^2 * (1 + lamda * V_DS);
            end
        end
        
        I_D(inner_loop, outer_loop) = I_D_value;
        
        inner_loop = inner_loop + 1;
    end
    
    legend_strings(outer_loop) = "V_G_S = " + V_GS + " V";
    
    outer_loop = outer_loop + 1;
end

plot(V_DS_sweep, I_D * 1E3)

title("Long Body NMOS Characteristics") 
xlabel("Drain to Source Voltage (V)")
ylabel("Drain Current (mA)")
legend(legend_strings, 'location', 'Northwest')
