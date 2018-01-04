function det = perf_roc(scores_fmr, scores_tmr) 
    det = [scores_fmr; scores_tmr]';
    % gets lowest TMR for every FMR value (rounded to 3 decimals) 
    %   > change @min to @max to use the highest FNMR per FMR value
    det_unique_fmr = unique(round(det(:,1), 3), 'rows');   
    det_max_tmr = accumarray(int64((det(:,1) + 1) * 1000),det(:,2),[],@min,-1);
    det_max_tmr = det_max_tmr(det_max_tmr > -1);
    det = [det_unique_fmr, det_max_tmr]';
    % plots results
    figure();
    plot(det(1,:), det(2,:));
    title("Receiver Operating Characteristic (ROC) curve");
    xlabel('FMR(t)');
    ylabel('TMR(t)');
    
end