function det = perf_det(scores_fmr, scores_fnmr) 
    det = [scores_fmr; scores_fnmr]';
    % gets lowest FNMR for every FMR value (rounded to 3 decimals) 
    %   > change @min to @max to use the highest FNMR per FMR value
    det_unique_fmr = unique(round(det(:,1), 3), 'rows');   
    det_max_fnmr = accumarray(int64((det(:,1) + 1) * 1000),det(:,2),[],@min,-1);
    det_max_fnmr = det_max_fnmr(det_max_fnmr > -1);
    det = [det_unique_fmr, det_max_fnmr]';
    % plots results
    figure();
    plot(det(1,:), det(2,:));
    title("Decision Error Trade-off (DET) curve");
    xlabel('FMR(t)');
    ylabel('FNMR(t)');
    
end