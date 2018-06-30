function [] = plot_histogram(gen, imp, binsize)
    if isempty(gen) || isempty(imp)
        close all;
        [~, gen, imp] = get_gen_imp;  
    end
    figure(); 
    hold on
    histogram(gen, binsize, 'FaceColor', 'r', 'EdgeColor', 'none', 'Normalization', 'probability');    
    histogram(imp, binsize, 'FaceColor', 'b', 'EdgeColor', 'none', 'Normalization', 'probability');
    xlim([-750 250])
    hold off
    
    title("Histogram of genuine and imposter scores");
    legend('Genuine scores', 'Impostor scores', 'Location','northwest');
    xlabel('Score');
    ylabel('Normalized probability'); 
end
