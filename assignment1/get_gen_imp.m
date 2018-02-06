function [aOut, gen, imp] = get_gen_imp(scorematrix_file, id_file)
    print_output = false;
    tic
    [S, Id] = get_scores_from_file(scorematrix_file, id_file);
    [np, nt] = size(S);

    gen = zeros(1, np*nt); % pre-allocate for speedup
    imp = zeros(1, np*nt);    
    
    %first loop over the rows of the lower triangular part of S
    gen_i = 1;
    imp_i = 1;
    for i=1:np
        j = 1;
            while j<i
                if Id(i)==Id(j)
                    %add to genuine scores
                    gen(gen_i) = S(i,j);
                    gen_i = gen_i + 1;
                else 
                    %add to impostor scores
                    imp(imp_i) = S(i,j);
                    imp_i = imp_i + 1;
                end
                j = j + 1;
            end
    end
    gen = gen(1:gen_i-1);
    imp = imp(1:imp_i-1);

    fprintf(' Size of imp: %u\n',size(imp, 2));
    fprintf(' Size of gen: %u\n',size(gen, 2));
    toc
    % displays results if necessary
    if print_output
        aOut = [gen, imp];
    else
        aOut = 0;
    end
end