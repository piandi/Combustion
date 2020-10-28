function [ k ] = ReactionConst( T )
% parameters of chemical kinectics
k0 = 100;
E = 1.e+5;
R = 8.3145;
% reaction constant
k = k0*exp(-E/R/T);
end

