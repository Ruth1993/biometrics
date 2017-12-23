function err = fnmr(t, gen, is_sorted, output)
    % keeps track of function runtime if necessary 
    if output
        tic
    end       
    % loads and sorts genuine scores if necessary
    if isempty(gen)
      close all;
      [~, gen, ~] = get_gen_imp;  
      gen = sort(gen, 'descend');
    elseif ~is_sorted
        gen = sort(gen, 'descend');
    end      
    % calculates percentage of all genuine scores < t
    err = 1-(size(gen(gen < t),2) / size(gen,2));
    % displays results if necessary
    if output
        fprintf('t and fnmr: %i %i\n', t, err)
        toc
    end
end