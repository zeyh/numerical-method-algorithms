%{
 phy240 
 2.3 pendula animation
%}
clear all;
close all;

fig1 = figure(1);
sub1 = subplot(1,2,1);

m = 10;
g = 10;
L = 10;

% %% treat sin(theta(t)) as theta(t)
% syms theta(t)
% Dtheta = diff(theta,t);
% equ1 = diff(theta,t,2) + g/L*theta(t) == 0;
% cond1 = theta(0) == 0;
% cond2 = Dtheta(0) == 1;
% cond = [cond1, cond2];
% thetaSol(t) = dsolve(equ1, cond);
% thetaSol = simplify(thetaSol);
% disp(thetaSol)
% 
% t = 0:0.1:10;
% x_pos = sin(t);
% y_pos = -cos(t);
% for i = 1:length(t)
%     hold on
%     plot(x_pos(i),y_pos(i),'r*') 
%     f(i) = getframe;
% end





%% use numerical approx
%% use numerical approx
g = 10; L=10;
b = 1;
h = 0.01;
t = 0:h:100;
theta = zeros(1,length(t));

ang_vel = 0.01*pi;
theta(1) = 0;
theta(2) = theta(1) + ang_vel*h;

for i=1:length(t)-2
    theta(i+2) = 2*theta(i+1) - theta(i) - h^2*g*sin(theta(i+1))/L + (b*h/m)*(theta(i)-theta(i+1)); %for t in the middle
end

plot(t, theta)






