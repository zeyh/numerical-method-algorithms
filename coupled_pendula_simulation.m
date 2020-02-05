%{
 Model two coupled pendula's position
 Jan 23, 2020
%}
clear all;
close all;

%% parameters
% initial conditions
xA(1) = 2; % initial position
vA(1) = 1; % initial velocity
xB(1) = 0.0; % initial position
vB(1) = 0.0; % initial velocity

% constants
g = 9.81; % gravitaional
% system parameters
L = 1; % length
k = 80; % spring constant
mA = 1; % mass of A
mB = 1; % mass of B
b = 1.0; % damping parameter

% time vector
t0 = 0; % initial time
tf = 10; % final time
dt = 0.03; % time incresement
t = t0:dt:tf; % time vector


%% numerical approx
% calculate initial two point of xA and xB using defn of derivative
xA(2) = xA(1) + vA(1)*dt;
xB(2) = xB(1) + vB(1)*dt;


%{ 
 % update rule (xA => X1, xB => X2) 
 diff(X1,t1,2) + g/L*X1(t1) +  k/mA*(X1(t1)-X2(t1)) + b/mA * diff(X1,t1,1) == 0 
 diff(X2,t1,2) + g/L*X2(t1) -  k/mB*(X1(t1)-X2(t1)) + b/mB * diff(X2,t1,1) == 0
 % (requires two points of xA and xB to calcuate next point)
 % (numerical approx second derivative & first derivative)
 diff(X1,t1,2) = (xA(i+1) - 2*xA(i) + xA(i-1)) ./ dt^2
 diff(X1,t1,1) = (xA(i) - xA(i-1)) ./ dt
%} 
for i=2:length(t)-1
    xA(i+1) = 2*xA(i) - xA(i-1) - dt^2*g/L .* sin(xA(i)) - dt^2*k/mA .* (xA(i)-xB(i)) - dt*(b/mA) * (xA(i)-xA(i-1)); 
    xB(i+1) = 2*xB(i) - xB(i-1) - dt^2*g/L .* sin(xB(i)) + dt^2*k/mB .* (xA(i)-xB(i)) - dt*(b/mB) * (xB(i)-xB(i-1)); 
end

% configure frame property
fig = figure(1);
set(fig, 'Position', [25 390 720 510]);

% plot position vs time
plot(t, xA, 'r')
hold on 
plot(t, xB, 'b')
% plot(t, xA+xB, 'g')
% plot(t, xA-xB, 'y')

% additional plotting info
title('two coupled pendula motion: position vs time'); 
xlabel('time (second)'); ylabel('position (meter)'); 
legend('pendulum A','pendulum B')


%% question answered
%{
 A) explain the behaviour that results from the parameters given in the
 figure above
 They all move in sinusoidal motion. Bob A would be released with an initial condition of 0.1 meters from
 equalibrium. so the spring in between is compressed that causes bob B to move
 in the positive direction due to the restoring force of the string.
 then their total motion, if viewing them in the same corrodinate, would have the same
 frequency as their sum normal mode (xA+xB). While the other normal mode
 q_diff describes their phase differences. The amplitude is determined by
 the initial position of A, since the energy is conserved in the system and
 B starts at the equalibrum. 

 B) what parameter would change to recorver the behaviour that the coupled
 pendulum bobs slowly changing energy between each other?
 give bob A a proper initial velocity and let A and B start at their equalibrium so that the kenitic energy could
 slowly change to potential energy, and because the spring force, the energy would slowly change between each other. 
(xA =0, vA = 1, xB = 0, vB = 0)
 
 C) observations
   if one bob's mass is significantly greater than the other, then the
 position of the bob with greater mass would move in a really small amplititude
 since the inertial component is so big that the restoring force would not
 be able to influence it a lot. For systems like this, both of the normal mode
 would be similar to the position change of the lighter mass. Moreover, if
 we add a proper damping force to this system, when time is large enough, the lighter bob would
 behave like the heavier bob with tiny phase difference and amplitude
 difference. (for example, mA = 1, mB = 100, b = 10)
 if we want the system to be overdamped so that both pendula would move and stop at the equalibrium, then the normal mode q_diff would
 be like an exponential decay function in the begining and then reaches to
 zero. if we can get the parameter such that it reaches to zero quickest,
 then the system could be critically damped. If the normal mode q_sum
 behaves like an exponential function while q_diff still have sinusoidal
 motions in the beginning, then the system is not overdamped.

 D) explain the limitation of your simulation.
  because of underflow, the simulation would not work if we want to approximate the position change that is too tiny beyond the digits that matlab floating number can store.
  Also, since we approximate the second order derivative, the approximation
  error is O(h^2). Thus, if we have too few point or the step size is too
  big, the results we got may not be accurate enough to discribe the
  actual physical motions. Also, when the initial velocity is too big, that
  would cause the gap between the initial two guesses in the loop to be too
  big, which would give non physical results -- their positions keep
  increasing with respect to time. Also, when the damping parameter b is
  too big, the simulation would give non-physical results.
%}


%% testing 
% equations of positions
% % Xa'' + g/l*Xa + k/m1(Xa-Xb) + b/m1 * Xa' = 0
% % Xb'' + g/l*Xb - k/m2(Xa-Xb) + b/m2 * Xb' = 0
% syms X1(t1) X2(t1)
% eqns = [ diff(X1,t1,2) + g/L*X1(t1) +  k/mA*(X1(t1)-X2(t1)) + b/mA * diff(X1,t1,1) == 0 
%          diff(X2,t1,2) + g/L*X2(t1) -  k/mB*(X1(t1)-X2(t1)) + b/mB * diff(X2,t1,1) == 0];
% conds = [X1(0)==xA(1), X2(0)==xB(1)]; %  diff(X1,0,1)==vA(1),, diff(X2,0,1)==vA(1)
% sol = dsolve(eqns, conds);
% solA(t1) = sol.X1;
% solB(t1) = sol.X2;

% normal modes
% qsum = xB(1) .* cos(sqrt(g/L)*t);
% qdiff = (-1)*xB(1) .* cos(sqrt(g/L+2*k/mA)*t);
% plot(t, qsum, 'g')
% hold on 
% plot(t, qdiff, 'g')

% solved analytically with initial condition xA = 0.1 all else 0
% X1 = 1/2 .* xA(1) .* (cos(sqrt(g/L)*t) - cos(sqrt(g/L+2*k/mA)*t));
% X2 = 1/2 .* xA(1) .* (cos(sqrt(g/L)*t) + cos(sqrt(g/L+2*k/mA)*t));
% plot(t, X1, 'g')
% hold on 
% plot(t, X2, 'y')

% plot the motion togehter in the x-axis wrt time

%{
for i = 1:length(t)
    subplot(2,1,1)
    plot(t, xA, 'r--')
    hold on 
    plot(t, xB, 'b--')
    plot(t(i), xA(i), 'r.')
    hold on 
    plot(t(i), xB(i), 'b.')
%     plot(t, xA+xB, 'g')
%     plot(t, xA-xB, 'y')
    hold on

    % plot the motion between two bob on x axis
    subplot(2,1,2)
    pbaspect([1 1 1])
    D = 1; % distance between two vertically parallel strings that held the pendula
    plot([0,xA(i)],[0,0], 'ro') 
    hold on
    plot([xA(i),xB(i)+D],[0,0],'g--')
    plot([0,xB(i)+D],[0,0], 'bo') 
    hold off
    axis([-5*D,5*D,-0.01,0.01])
    % additional plotting info
    title('horisontal position of A & B change with respect to time'); 
    xlabel('position (meter)');
    legend('pendulum A','spring','pendulum B')
    
    f(i) = getframe;  
end
%}
