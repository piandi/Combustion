clear;
% investigate ranges
i_eta = 4:0.5:9;
i_TW = 750:20:850;
% initialize
k = 0;
n = size(i_eta,2)*size(i_TW,2);
% define the output variables
evo = repmat(struct('eta', [], 'TW', [], 'T', [], 'C1', [], 'C2', []), n, 1);

global eta TW_set;
options = odeset('RelTol', 1e-4, 'AbsTol', [1e-4,1e-4,1e-4]);
for i = 1:size(i_eta,2)
  for j = 1:size(i_TW,2)
    eta = i_eta(i); % coefficient of heat transfer (W/m-K)
    TW_set = i_TW(j); % initial wall temperature (K)
    % set initial condition
    y0 = [TW_set,1,1];
    % solve the odes
    [time, y] = ode45(@HeatBalance2, [0, 0.5e+3], y0, options);
    % pack into the output variable
    k = k+1;
    evo(k).eta = eta;
    evo(k).TW = TW_set;
    evo(k).T = [time, y(:,1)];
    evo(k).C1 = [time, y(:,2)];
    evo(k).C2 = [time, y(:,3)];
  end
end
% save the results
save('output.mat', 'evo');
% clear the memory
clear;


