%bisection method function approx

x = [0:0.5:10];
y = (5-x).*exp(x) -5;
plot(x,y)

f = inline('(5-x).*exp(x) -5');
f = inline('sin(x)+1')
f = inline('(x.^2 - 2.*x + 1)/(x.^2-x-2)');
a = 4;
b = 5;
p = (a + b ) / 2;
err = abs (f(p));
interval = abs(p);
count = 0;
while interval > 10^(-6)
    
    prev_p = p;
    if f(a) *f(p) <0
        b = p;
    else
        a = p;
    end
    p = (a+b)/2;
    err = abs(f(p));
    interval = abs(prev_p - p);
    count = count+ 1;
%     fprintf("[%1.6f, %1.6f]", a,b)
%     fprintf("-----")
end
fprintf("[%1.6f, %1.6f]", a,b)
disp(count)


% %0-1.5, 1.5-3
% x = [0.5:0.005:2.5];
% % x = [1.5:0.005:3];
% y = (x.^2 - 2*x + 1)./(x.^2-x-2);
% plot(x,y)
