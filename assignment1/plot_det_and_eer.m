function plot_det_and_eer(scores_fmr_tmr, log_x, log_y) 
    % calculates the EER point
    x = scores_fmr_tmr(2,:);
    y = 1 - scores_fmr_tmr(3,:);
    idx = find(y - x < eps, 1);
    x_eer = x(idx);
    y_eer = y(idx);  

    % plots the DET curve with the EER point
    figure();
    hold on
    plot(x, y);  
    plot(x, x, '--');
    plot(x_eer, y_eer, 'r.', 'MarkerSize', 18)    
    text(x_eer+0.02,x_eer+0.02,['(', num2str(x_eer), ', ', num2str(y_eer), ')'])
    if log_x
        set(gca, 'xscale', 'log')
    end
    if log_y
        set(gca, 'yscale', 'log')
    end
    hold off
    legend('DET', 'Identity line', 'EER', 'Location','northwest');  
    title("Decision Error Trade-off (DET) curve and EER");
    xlabel('FMR(t)');
    ylabel('FNMR(t)');
    
end