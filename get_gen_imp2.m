
function [gen, imp] = get_gen_imp2
[S, Id] = get_scores_from_file;

[np, nt] = size(S);

gen = [];
imp = [];

%first loop over the rows of the lower triangular part of S
for i=1:np
    j = 1;
        while j<i
            if Id(i)==Id(j)
                %add to genuine scores
                gen = [gen S(i,j)];
            else 
                %add to impostor scores
                imp = [imp S(i,j)];
            end
            j=j+1;
        end
end

fprintf(' Size of imp: %u x\n',size(imp));
fprintf(' Size of gen: %u x\n',size(gen));

%figure(3)
%histogram(gen, 100, 'FaceColor','r')
%hold on
%histogram(imp, 100, 'FaceColor','b')
%hold off

%[f,x]=hist(gen,50);%# create histogram from a normal distribution.
%[h,y]=hist(imp,50);%# create histogram from a normal distribution.

%figure(3)
%bar(x,f/trapz(x,f));hold on
%bar(y,h/trapz(y,h))
%plot(x,'r');
%plot(y,'b');
%hold off

%figure(3)
%f = histogram(gen, 'BinEdges', -1000:50:500, 100, 'FaceColor', 'r', 'EdgeColor', 'none', 'Normalization', 'probability')
%hold on
%h = histogram(imp, 'BinEdges', -1000:50:500, 100,  'FaceColor', 'b', 'EdgeColor', 'none', 'Normalization', 'probability')
%hold off
end