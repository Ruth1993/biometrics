function roc = perf_roc(scores_fmr, scores_tmr) 
    roc = [scores_fmr; scores_tmr]';
    % gets lowest TMR for every FMR value (rounded to 3 decimals) 
    %   > change @min to @max to use the highest TMR per FMR value
    roc_unique_fmr = unique(round(roc(:,1), 3), 'rows');   
    roc_max_tmr = accumarray(int64((roc(:,1) + 1) * 1000),roc(:,2),[],@min,-1);
    roc_max_tmr = roc_max_tmr(roc_max_tmr > -1);
    roc = [roc_unique_fmr, roc_max_tmr]';
    % plots results
    figure();
   	semilogx(roc(1,:), roc(2,:));
    %ylim([0.7,1]);
    %set(gca, 'yscale', 'log')
    title("Receiver Operating Characteristic (ROC) curve");
    xlabel('FMR(t)');
    ylabel('TMR(t)');
    
end