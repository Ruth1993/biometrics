function errors = perf_fnmr(t_min, t_max, gen, output)
    num = abs(t_max - t_min) + 1;
    diff_1 = 1 - t_min;
    % loads genuine scores if necessary
    if isempty(gen)
      close all;
      [~, gen, ~] = get_gen_imp;  
    end
    % sorts genuine scores (descending)
    gen_sorted = sort(gen, 'descend');
    % calculates FNMR for every t between t_min and t_max (inclusive)
    errors = zeros(1, num); % pre-allocate for speedup
    for t=t_min:1:t_max
        errors(t + diff_1) = fnmr(t, gen_sorted, true, output);    
    end 
    % plots results
    figure();
    plot(t_min:t_max, errors);
    title("False Nonmatch Rate (FNMR) for given threshold");
    xlabel('Value of threshold');
    ylabel('FNMR: % genuine score > threshold '); 
end