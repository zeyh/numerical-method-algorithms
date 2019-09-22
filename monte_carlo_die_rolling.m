%{
sep 7
simulate rolling a die
%}

%ex1 float between 1-6 uniform distribution
% rng(0,'twister');
a = 1;
b = 6;
r = (b-a).*rand(1) + a;
% r_range = [min(r) max(r)];
% disp(r);

%ex2
A = zeros(100,1);
for n_tries=1:100
    for count=1:1000
        %two ver of random number gen
        k = randi([1 6],1,1);
        k_tmp = (b-a).*rand(1) + a;
        k_round = int16(k_tmp);
        A(n_tries) = A(n_tries)+k;
    end
    A(n_tries) = A(n_tries)/1000;
end
var_a = var(A);
mean_a = mean(A);
std_a = std(A);
fprintf('mean: %.3f, variance: %.3f, sd: %.3f \n', mean_a,var_a,std_a)
hist(A)
            


