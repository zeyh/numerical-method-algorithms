function y = Zeyangusolve(L,b)

n = length(b);
for i = n:-1:1
    y(i) = b(i);
    for j = i-1:-1:1
        y(i) = y(i) - L(i,j)*y(j);
    end
    
end
