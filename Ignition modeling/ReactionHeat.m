function [ Q1 ] = ReactionHeat( t, T )
%% Calculate the heat of reaction
%  input arguments T - temperature
%  parameters of chemical kinectics
k0 = 100;
E = 1.e+5;
R = 8.3145;
n = 1;
V = 1;
Q = 2.e+7;
C = 1; % molar concentration of gas reactant
% Reaction speed
k = k0*exp(-E/R/T);
W = k*C^n;
% Heat of reaction
Q1 = W*V*Q;
end

