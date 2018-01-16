function det = perf_det2(scores_fmr, scores_fnmr) 
    det = [scores_fmr; scores_fnmr]';
    % gets lowest FNMR for every FMR value (rounded to 3 decimals) 
    %   > change @min to @max to use the highest FNMR per FMR value
    det_unique_fmr = unique(round(det(:,1), 3), 'rows');   
    det_max_fnmr = accumarray(int64((det(:,1) + 1) * 1000),det(:,2),[],@min,-1);
    det_max_fnmr = det_max_fnmr(det_max_fnmr > -1);
    det = [det_unique_fmr, det_max_fnmr]';
    % plots results
    figure();
    x = det(1,:);
    y1 = det(2,:);
    y2 = [0:size(y1,2):1];
    
    %idx = find(y1 - y2 < eps, 1); %// Index of coordinate in array
    %px = x(idx);
    %py = y1(idx);
    
    plot(x, y1);
    hold on
    plot(x, y2, '--');
    hold on
    %plot(px, py, 'ro', 'MarkerSize', 18)
    hold off
    title("Decision Error Trade-off (DET) curve");
    xlabel('FMR(t)');
    ylabel('FNMR(t)');
    
end