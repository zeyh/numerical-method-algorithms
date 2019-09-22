%{
Chap 3 HW, Exercises 10
Sep 11, 19
monte carlo area approx
reference: https://www.mathworks.com/matlabcentral/answers/214587-basic-monte-carlo-question-area-of-circle
%}

%10 estimate area inside  --------------
%a)plot the ellipse
real_area = 6.28;
pos = [-2,-1,4,2];
rectangle('Position',pos,'Curvature',[1 1])
grid on
hold on

%b) ran num gen
N = 1000;
Iter = 1000;
results = zeros(Iter,1); %for question e
% for index = 1:Iter
    x = -2 + 4.*rand(N,1);
    y = -1 + 2.*rand(N,1);
    plot(x,y,'.b');

    %c) determine if in the ellipse
    radii = sqrt((1*x).^2+(2*y).^2);
    r = 2;
    i = radii <= r;
    hits = sum(i);
    misses = N-hits;
%     results(index) = hits/N;
    plot(x(i),y(i),'.r');
    fprintf('10) estimate ellipse \n');
    fprintf('Area: %1.3f, ',hits/N*8);
    fprintf('fraction: %1.3f, ',hits/N);
    fprintf('E: %1.3f, Var:%1.3f, sd:%1.3f\n',hits/N, hits/N-(hits/N)^2, sqrt(hits/N-(hits/N)^2));   
% end
% a = std(results);
% b = var(results);
% c = mean(results);















