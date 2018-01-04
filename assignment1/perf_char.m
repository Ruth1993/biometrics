function perf_char
    [~, gen, imp] = get_gen_imp;
    t_min = -750;
    t_max = 150;
    
    [scores_fmr, scores_fnmr] = perf_fmr_fnmr(t_min, t_max, imp, gen, [])
    perf_det2(scores_fmr, scores_fnmr)
    perf_roc(scores_fmr, 1-scores_fnmr)
end