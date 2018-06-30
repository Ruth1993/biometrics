function scores_tmr_fmr = perf_tmr_fmr(gen, imp)
   
    % loads imposter and genuine scores if necessary
    if isempty(imp) || isempty(gen)
      close all;
      [gen, imp] = get_gen_imp('scorematrix.txt','id.txt');  
    end
    
    % determines t_min as min imposter score, and t_max as max genuine
    % score
    t_min = floor(min(imp));
    t_max = ceil(max(gen));
    num = abs(t_max - t_min) + 1;
    
    scores_tmr_fmr = zeros(3, t_max - t_min + 1);
    scores_tmr_fmr(1,:) = t_max:-1:t_min;
    % sort and convert scores to integer arrays
    gen_sorted = sort(int32(gen), 'descend');
    imp_sorted = sort(int32(imp), 'descend');
    scores_fmr = zeros(1, num); % pre-allocate for speedup
    scores_tmr = zeros(1, num);
    % walk through both lists and save fmr resp. tmr
    last_t = t_max;
    for i = 1:size(imp_sorted, 2)
        t = imp_sorted(1, i);
        if t < last_t
            scores_fmr(t_max - last_t + 1 : t_max - t + 1) = (i - 1) / size(imp_sorted, 2);
            last_t = t;
         end
    end
    scores_fmr(t_max - last_t + 1 : end) = 1;
    last_t = t_max;
    for i = 1:size(gen_sorted, 2)
        t = gen_sorted(1, i);
        if t < last_t
            scores_tmr(t_max - last_t + 1 : t_max - t + 1) = (i - 1) / size(gen_sorted, 2);
            last_t = t;
         end
    end
    scores_tmr(t_max - last_t + 1 : end) = 1;
    scores_tmr_fmr(2:3,:) = [scores_fmr; scores_tmr];                       
end
 