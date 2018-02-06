function [err_fmr, err_fnmr] = perf_fmr_fnmr(t_min, t_max, imp, gen, output)
    num = abs(t_max - t_min) + 1;
    diff_1 = 1 - t_min;
    
    % loads imposter and genuine scores if necessary
    if isempty(imp) || isempty(gen)
      close all;
      [~, gen, imp] = get_gen_imp;  
    end
    % sorts imposter scores (ascending)
    imp_sorted = sort(imp);
    % calculates FMR for every t between t_min and t_max (inclusive)
    err_fmr = zeros(1, num); % pre-allocate for speedup
    for t=t_min:1:t_max
        err_fmr(t + diff_1) = fmr(t, imp_sorted, true, output);    
    end  
    % sorts genuine scores (descending)
    gen_sorted = sort(gen, 'descend');
    % calculates FNMR for every t between t_min and t_max (inclusive)
    err_fnmr = zeros(1, num); % pre-allocate for speedup
    for t=t_min:1:t_max
        err_fnmr(t + diff_1) = fnmr(t, gen_sorted, true, output);    
    end 
    
    % plots results
    figure();
    plot(t_min:t_max, err_fmr);
    hold on
    plot(t_min:t_max, err_fnmr);
    ylim([0,1]);
    legend('FMR', 'FNMR', 'Location','northwest');
    title("FMR and FNMR for given threshold");
    xlabel('Value of threshold');
    ylabel('FMR and FNMR: percentage of score > threshold '); 
end