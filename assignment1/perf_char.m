function perf_char
    [~, gen, imp] = get_gen_imp("scorematrix.txt", "id.txt");
    t_min = -750;
    t_max = 150;
    
    close all;
    
    create_histogram(gen, imp)
    [scores_fmr, scores_fnmr] = perf_fmr_fnmr(t_min, t_max, imp, gen, []);
    perf_roc(scores_fmr, 1-scores_fnmr)
    perf_det2(scores_fmr, scores_fnmr)
end