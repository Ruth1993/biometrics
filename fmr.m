function err = fmr(t)
[gen, imp] = get_gen_imp2;

%set of all impostor scores s > t
omgt = [];

for i=1:size(imp,2)
    if imp(i)>t
        omgt = [omgt imp(i)];
    end
end

omgt_s = size(omgt,2);
imp_s = size(imp,2);
err = double(omgt_s)/double(imp_s);
fprintf('t, omgt, size(imp,2), err: %i %i %i %d\n', t, omgt_s, imp_s, err)
end