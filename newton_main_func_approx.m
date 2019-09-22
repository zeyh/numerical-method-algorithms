%{
sep 21,19
chapter 4 ex2b & ex4
newton method approx
%}
clear all;
syms x
% f = (5-x).*exp(x)-5; %ex2b
f = x.^2 -2; %ex4
x0 = 2;
tol = 1e-6;
fp = diff(f);
%% has to change sym func to anoymous func
[outx, outy] = newton_method(matlabFunction(f),matlabFunction(fp), x0, tol);
fprintf("approx result: %1.6f\n", outx);
