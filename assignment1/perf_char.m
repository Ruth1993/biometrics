function perf_char
figure(5)
[~, gen, imp] = get_gen_imp;

res = zeros(1, 750)
for t=1:1:750
    res(t) = fmr(t - 750, gen, imp);    
    
plot(-750:1:0, res);
end