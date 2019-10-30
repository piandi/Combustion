function [ dy ] = HeatBalance2( t, y )
%% Define the ode for heat balance
%  input arguments t - time
%                  y - odes variable array
%  initialize
dy = zeros(3,1);
%  input interface
T = y(1);
C1 = y(2);
C2 = y(3);
%  parameters of heat balance
V = 1.0;
rho = 1.0;
cv = 1.e+3;
k1 = ReactionConst(T); 
k2 = ReactionConst(T);
% ode definition
dT = (ReactionHeat2(t, T, C1, C2)-DissipationHeat(t, T))/(V*rho*cv);
dC1 = -k1*C1;
dC2 = -k2*C2;
% output interface
dy(1) = dT;
dy(2) = dC1;
dy(3) = dC2;
end

