function [ Q1 ] = ReactionHeat2( t, T, C1, C2 )
%% Calculate the heat of reaction
%  input arguments t  - time (s)
%                  T  - temperature (K)
%                  C1 - molar concentration of gas (kmol/m3)
%                  C2 - molar concentration of O2 (kmol/m3)
n = 1;
V = 1;
Q = 2.e+7;
% Reaction speed
k = ReactionConst(T);
W = k*C1^n*C2^n;
% Heat of reaction
Q1 = W*V*Q;
end

