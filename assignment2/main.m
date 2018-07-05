function main    
    t_min = -3000;
    t_max = 0;
    output = false;
    close all
    
    addpath ../assignment1/  
    
    % gets fmr and fnmr scores
    [gen, imp] = get_gen_imp("Scorematrices/scorematrix_60.txt", "identitiesmatrix.txt");
    
    [scores_fmr, scores_fnmr] = perf_fmr_fnmr(t_min, t_max, imp, gen, output);
   
    perf_det2(scores_fmr, scores_fnmr)
    perf_roc(scores_fmr, 1 - scores_fnmr)
    
    rmpath ../assignment1/ 
    
end