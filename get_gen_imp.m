
function [gen, imp] = get_gen_imp
[S, Id] = get_scores_from_file;

[np, nt] = size(S);

M = max(Id);
N = np*nt;
R = N/M;

gen = [];
imp = [];


for i=1:np
    for j=1:nt
        %check if j>=i for we only want the lower triangle and diagonal
        disp('i and j: ' + i + ' ' + j);
        if(i>=j)
            if(Id(i)==Id(j) && i~=j)
                %we found a genuine score
                gen(end+1) = S(i, j);
            else
                %impostor score
                imp(end+1) = S(i, j);
            end
        end
    end
end

fprintf(' Size of imp: %u x\n',size(imp));
fprintf(' Size of gen: %u x\n',size(gen));

fprintf('Gen: %s\n', sprintf('%d ', gen));
fprintf('Imp: %s\n', sprintf('%d ', imp));