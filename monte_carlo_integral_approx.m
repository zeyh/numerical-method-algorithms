%{
monte carlo intergal approx
Chap 3 HW, Exercises 12
Sep 12, 19
%}
% 12 monte carlo for 10 dim integral
    fprintf('12) monte carlo for 10 dim integral \n');
%     N = 200000; 
    vol_box = 4^10;
    real = 2^10;
    N_trails = [10000,40000,160000];
    trail_num = length(N_trails);
    dim = 10;
    err = zeros(trail_num,1);
    for n = 1:trail_num
        count = 0; frac = 0; result = 0; sd = 0; n_tmp = 0;
        n_tmp = N_trails(n);
        for i = 1:n_tmp
            X = round(rand(dim,1)); % a uniform binary matrix with shape(10,1)
            if nnz(X) == dim % sum of 1s in the matrix
                count = count +1;
            end
        end
        frac = count/n_tmp;
        result = frac*vol_box;

        sd = sqrt((real - result)^2);
        fprintf('b) #%d, result: %1.4f,sd: %1.4f\n',n, result, sd);

        err(n) = sd;
    end

    clear sum
    % disp(sum(results - real_val))
    sd_trails = sqrt(sum(err).^2./trail_num);
    fprintf('c) sd: %1.4f\n',sd_trails);

