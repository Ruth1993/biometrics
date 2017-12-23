function errors = perf_fmr(t_min, t_max, imp, output) 
    num = abs(t_max - t_min) + 1;
    diff_1 = 1 - t_min;
    % loads imposter scores if necessary
    if isempty(imp)
      close all;
      [~, ~, imp] = get_gen_imp;  
    end
    % sorts imposter scores (ascending)
    imp_sorted = sort(imp);
    % calculates FMR for every t between t_min and t_max (inclusive)
    errors = zeros(1, num); % pre-allocate for speedup
    for t=t_min:1:t_max
        errors(t + diff_1) = fmr(t, imp_sorted, true, output);    
    end  
    % plots results
    figure();
    plot(t_min:t_max, errors);
    title("False Match Rate (FMR) for given threshold");
    xlabel('Value of threshold');
    ylabel('FMR: % imposter score > threshold '); 
end