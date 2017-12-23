function perf_char
    [gen, imp] = get_gen_imp;
    perf_fmr_fnmr(-750, 0, imp, gen, [])
    %perf_fnmr(-750, 0, gen, [])
end