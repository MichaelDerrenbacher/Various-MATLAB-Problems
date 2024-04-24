function [data_x, data_y] = gen_data(type)
    if type == 1
        % 4 clusters
        data_x = [normrnd(2, 0.5, 1,16),  normrnd(4, 1, 1,16),  normrnd(8, 0.5, 1,8),  normrnd(8, 1, 1,8)];
        data_y = [normrnd(4, 1, 1,16),    normrnd(7, 1, 1,16),  normrnd(8, 0.5, 1,8),  normrnd(3, 0.5, 1,8)];
    elseif type == 2  
        % 2 columns
        data_x = [normrnd(3, 0.5, 1,16), normrnd(7, 0.5, 1,16)];
        data_y = rand(1,32)*10;
    elseif type == 3
        % full random
        data_x = rand(1,32)*10;
        data_y = rand(1,32)*10;
    else
        disp("Type not implemented")
        data_x = 0;
        data_y = 0;
    end
end