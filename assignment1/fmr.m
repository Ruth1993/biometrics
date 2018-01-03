function err = fmr(t, imp, is_sorted, output)
    % keeps track of function runtime if necessary 
    if output
        tic
    end
    % loads and sorts genuine scores if necessary
    if isempty(imp)
      close all;
      [~, ~, imp] = get_gen_imp;  
      imp = sort(imp);
    elseif ~is_sorted
        imp = sort(imp);
    end
    % calculates percentage of all impostor scores > t
    err = size(imp(imp > t),2) / size(imp,2);
    fprintf('size(imp>t) and size(imp): %i %i\n', size(imp(imp > t),2), size(imp,2))
    % displays results if necessary
    if output
        fprintf('t and fmr: %i %i\n', t, err)
        toc
    end
end