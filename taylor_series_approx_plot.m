%{
chap4 hw excise 18
sep 16, 19
plot tayler approx with different orders
ref: https://www.mathworks.com/help/symbolic/taylor-series.html
%}
syms x
g = exp(1-x^2); %the fcn we want to approx

for i = 1:6
    t = taylor(g, 'ExpansionPoint', 1, 'Order', i); %get the taylor series at x=1 with order i
    t = simplify(t); %simplify the taylor result just got
%     size(char(t));
    xd = 0:0.05:2.5; %define x axis's scale
    yd = subs(g,x,xd);
    fplot(t, [0, 2.5]);
    hold on
    legent_txt = ['order:',num2str(i)];   
end
plot(xd, yd,'r.-', 'DisplayName', 'actual fcn') %plot the actual function
title('Taylor approximation vs. actual function')
hold off
legend show %ccreate different legends corresponding to different order



