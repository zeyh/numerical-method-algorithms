%{ 
 Jan 21
 Numerical intergration, fourier preview
%}

%% parameters for numerical integratiion
clear all;
close all;
L = 1; n=1; A=1;
dx = 0.01;
x = 0:dx:L/2;
sym y
y = A*sin(n.*pi/L.*x);
% plot(x,y)

%% riemann sum
rieman_ingl = 0;
for i=1:length(y)
    rieman_ingl = rieman_ingl + y(i)*dx; 
end
fprintf("riemann sum: %.8f \n",rieman_ingl);

%% trapz sum
trapz_ingl = 0;
for i=1:length(y)-1
    trapz_ingl = trapz_ingl + (y(i)+y(i+1))*dx/2; 
end
fprintf("trapzoid sum implemented: %.8f \n",trapz_ingl);
trapz_ingl_buildin = trapz(x, y);
fprintf("trapzoid sum build in: %.8f \n",trapz_ingl_buildin);

%% build in integral
fun = @(x) A*sin(n*pi/L*x);
ingl_buildin = integral(fun, 0, L/2);
fprintf("integral build in: %.8f \n",ingl_buildin);


%% 4.1 fourier preview
clear all;
close all;
L = 1;  
A=1; B=1;  % n is an integer, L is any constant

fn = @(x, n, A) A*sin(n*pi/L*x);
gn = @(x, n, B) B*cos(n*pi/L*x);
ps_nm = @(x,n,m,An,Am) fn(x,n,An).*fn(x,m,Am);
pc_nm = @(x,n,m,Bn,Bm) gn(x,n,Bn).*gn(x,m,Bm);

%ploting
fig = figure(1);
set(fig,'position',[50,300,1200,500]);
clf

row = 2; col = 4;
for i=1:8
    hold off
    for c=1:8
        subplot(row,col,c)
        %plot f1, fc,ps1c
        
        fplot(@(x) fn(x,i,A), 'r')
        hold on
        fplot(@(x) fn(x,c,A), 'g')
        hold on
        fplot(@(x) ps_nm(x,1,c,A,A), 'b')
%         hold off
        ingl = integral(@(x) ps_nm(x,1,c,A,A), 0, L);
        title(['Integral = ', num2str(ingl,'%3.2f')]); 
    end
    hold off
    f(i) = getframe;
end



