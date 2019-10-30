function [ dT ] = HeatBalance( t, T )
%% Define the ode for heat balance
%  input arguments t - time
%                  T - temperature
%  parameters of heat balance
V = 1.0;
rho = 1.0;
cv = 1.e+3;
% ode definition
dT = (ReactionHeat(t, T)-DissipationHeat(t, T))/(V*rho*cv);
end

