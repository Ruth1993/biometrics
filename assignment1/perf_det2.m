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
    
    idx = find(y1 - x < eps, 1); %// Index of coordinate in array
    px = x(idx);
    py = y1(idx);
    
    plot(x, y1);
    hold on
    plot(x, x, '--');
    plot(px, py, 'r.', 'MarkerSize', 18)
    text(px+0.02,py+0.02,['(', num2str(px), ', ', num2str(py), ')'])
    legend('DET', 'Identity line', 'EER', 'Location','northwest');
    hold off
    title("Decision Error Trade-off (DET) curve and EER");
    xlabel('FMR(t)');
    ylabel('FNMR(t)');
    
end