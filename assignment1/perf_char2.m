function perf_char2
y = @(x) fmr(x);
f = @(x) fnmr(x);

fplot(y, [-750 0])
hold on
fplot(f, [-750 0])
end