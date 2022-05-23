function plot_signals(signal_array, signal_string_array, signal_color_array)
    number_of_signals = length(signal_array(:,1));

    % plot each signal in signal_array
    for signal_num = 1:number_of_signals
        subplot(number_of_signals, 1, signal_num)
        plot(signal_array(signal_num, :), ...
             'linewidth', 1.2, ...
             'color', signal_color_array(signal_num))
        
        % remove X, Y ticks
        set(gca,'XTick',[])
        set(gca,'YTick', [])
        
        % print Y labels horzontially and with right justfied spacing
        ylabel(signal_string_array(signal_num) + ...
            strjoin(repmat(" ", 1, strlength(signal_string_array(signal_num)))))
        hYLabel = get(gca,'YLabel');
        set(hYLabel,'rotation',0,'VerticalAlignment','middle')

    end