function [] = create_histogram(gen, imp)
    if isempty(gen) || isempty(imp)
        close all;
        [~, gen, imp] = get_gen_imp;  
    end
    figure(3)
    
    histogram(gen, 250, 'FaceColor', 'r', 'EdgeColor', 'none', 'Normalization', 'probability');
    hold on
    histogram(imp, 250, 'FaceColor', 'b', 'EdgeColor', 'none', 'Normalization', 'probability');
    xlim([-750 250])
    title("Histogram of genuine and imposter scores");
    legend('Genuine scores', 'Impostor scores', 'Location','northwest');
    xlabel('Score');
    ylabel('Normalized probability'); 
    hold off
end

% some old functions

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