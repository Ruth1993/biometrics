% Performs all parts of the assignment
close all;  
clc;

% load scores
[gen, imp] = get_gen_imp('scorematrix.txt','id.txt');

% Step 4 - plot genuine and imposter histogram
binsize = 200;
plot_histogram(gen, imp, binsize);

% Step 5 - plot tmr and fnmr as function of threshold
scores_tmr_fmr = perf_tmr_fmr(gen, imp);
plot_fmr_fnmr(scores_tmr_fmr);

% set both to false for step 5 and vary them for step 6
do_log_x = false;
do_log_y = false;

plot_det_and_eer(scores_tmr_fmr, do_log_x, do_log_y);
plot_roc(scores_tmr_fmr, do_log_x, do_log_y)


