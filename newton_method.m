%{
sep 21,19
newton method approx
%}

function [out_x,out_y] = newton_method(f,fp,x0,tol)
%% 	
%% newton.m
%% 
%% Implements Newton's method
%%
%% Input: 	
%%      f   function
%%      fp  derivative of function
%%      x0	initial guess for the root of f
%% 		tol	the tolerance/accuracy we desire
%% 
%% Output:	out_x approx of x
%%          out_y f(xhat)
%% 
%% Syntax:   Newton(f,fp,x0, tol)
%%
format long e
fc = f(x0);
fprintf('initial guess:  c=%1.9f, fc=%1.9f\n',x0,fc)

if abs(fc) <= tol
    out_x = x0; %% check to see if initial guess satisfies
    out_y = fc;
    return;   %% convergence criterion.
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                       %%
%% main routine                                                          %%
%%                                                                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i = 1; %% iteration number known the first one
c(1) = x0 - f(x0)/fp(x0); 
while abs(fc) > tol
    c(i+1) = c(i) - f(c(i))/fp(c(i));
    fc = f(c(i));
    i = i+1;
    fprintf('approx c=%1.9f, fc=%1.9f\n',c(i),fc)
    
end
out_x = c(i);  %% return the approx root
out_y = fc;
fprintf('iter num: %d\n',i)

