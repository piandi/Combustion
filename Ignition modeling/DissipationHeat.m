function [ Q2 ] = DissipationHeat( t, T )
%% Calculate the heat dissipating to the vessel containing the gas
%  input arguments T  - temperature of gas mixture
%  parameters of heat tranfer
global eta TW_set;
S = 6; % area of heat transfer
TW = TW_set; % wall temperature of vessel
% dissipation heat
Q2 = eta*S*(T-TW);
end

