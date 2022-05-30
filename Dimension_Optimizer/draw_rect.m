function draw_rect(W, L)

    plot(0,0)
    hold on
    line([0, W], [L, L])  % top side
    line([0, W], [0, 0])  % bottom side
    line([0, 0], [0, L])  % left side
    line([W, W], [0, L])  % right side

    max_dimension = max(L, W);
    
    xlim([0 - max_dimension/10, max_dimension + max_dimension/10])
    ylim([0 - max_dimension/10, max_dimension + max_dimension/10])
    grid on
    axis square
end

