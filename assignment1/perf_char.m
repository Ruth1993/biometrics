function perf_char
    [gen, imp] = get_gen_imp;
    perf_fmr(-750, 150, gen, [])
    perf_fmr_fnmr(-750, 150, imp, gen, [])
    
end