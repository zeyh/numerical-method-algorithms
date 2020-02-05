%{
fixed point function
oct 1 2019
%}

function fixed_point(phi, guess, tol)

x = guess;
px = phi(x);

while abs(x-px) > tol
    x = px;
    px = phi(x);
    
    fprintf(' x = %d, px = %d \n', x,px);
end

return


