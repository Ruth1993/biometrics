function plot_fmr_fnmr(scores_tmr_fmr)
    % plots results
    figure();
    hold on
    plot(scores_tmr_fmr(1, :), scores_tmr_fmr(2, :));
    plot(scores_tmr_fmr(1, :), 1 - scores_tmr_fmr(3, :));
    ylim([0,1]);
    hold off
    legend('FMR', 'FNMR', 'Location','northwest');
    title("FMR and FNMR for given threshold");
    xlabel('Value of threshold');
    ylabel('FMR and FNMR: percentage of score > threshold '); 
end