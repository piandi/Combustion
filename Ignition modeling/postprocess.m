%% postprocess
% load the data file
load('output.mat')
% extract the results
n = size(evo,1);
% get the T(t) for different TW at given eta
hold on;

for i = 1:n
    if evo(i).eta == 5;
        descript = sprintf('TW = %.1f K', evo(i).TW);
        % draw the figure
        plot(evo(i).T(:,1), evo(i).T(:,2), 'DisplayName', descript);
        legend([])
        axis([0,300,600,3000]);
        xlabel('\tau /s');
        ylabel('T /K');
    end
end

hold off;