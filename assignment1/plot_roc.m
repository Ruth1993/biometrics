function plot_roc(scores_fmr_tmr, log_x, log_y) 
    % plots the ROC curve
    figure();
   	plot(scores_fmr_tmr(2,:), scores_fmr_tmr(3,:));    
    if log_x
        set(gca, 'xscale', 'log')
    end
    if log_y
        set(gca, 'yscale', 'log')
    end
    title("Receiver Operating Characteristic (ROC) curve");
    xlabel('FMR(t)');
    ylabel('TMR(t)');
end