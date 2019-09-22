%{
chap4 hw excise 19
sep 16, 19
taylor series approx arctan
ref: https://www.mathworks.com/help/symbolic/atan.html
%}

% original = @(x) atan(x);
syms x
g = atan(x);
for i = 1:5 %change max to 15, get err around 0.0021
    t = taylor(g, 'ExpansionPoint', 4.25, 'Order', 2*i-1); %order is 1,3,5,7,9
    t = simplify(t);
    x = 1/5; %plug in the tayler function with x = 1/5
    t1 = subs(t);
    clear x; %plug in the tayler function with x = 1/239
    x = 1/239;
    t2 = subs(t);
    T = 16.*t1 - 4.*t2; %get the fcn: 16*Pi(1/5)-4*Pi(1/239)
    result = vpa(T); %get the sym function's result
    error = abs(vpa(T) - vpa(pi)); %compare with the error
    disp(error)   
end
