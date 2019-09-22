% e = exp(1);
% n = 10 .^ (log10(exp(1)).*lambertw(5 ./ log10(exp(1))));
num_iteration = 100;
x = zeros(num_iteration, 1);
y = zeros(num_iteration,1);
for i = 1:100
    n = 10 ^ (log10(exp(1))*lambertw(i / log10(exp(1))));
    x(i) = i;
    y(i) = n;
    
end

plot(x, y)
hold on
plot(x, x)
hold off


disp(x);
disp(y);