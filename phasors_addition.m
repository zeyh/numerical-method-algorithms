%{
 PHY240 #quiz 1
 plot sum of phasors: hold time constant, but vary phase constants
 1/11/2020 
 Zeyang Huang
%}

%% answer to questions A) & B)
%{
 A) Examine the plots, what does or doesn't change when alpha1 is changed?
    when alpha 1 changed, the starting point (phase) changed for the summed phasor
    while the period, amplitude remain unchanged.

 B) Run cases where all amplitudes are identical vs unequal.
    if compared to the case of identical amplitude, the
    squared amplitude of the summed phasor with unequal amplitude will not be zero.
    Also, if there is a vibration with a significant larger amplitude than
    others, then it would dominate the behaviour of the summed phasor. 
%}

clear all;
close all;

%% set the parameters

%given parameters
% A = [1, 1, 1, 1, 1]; 
% A = [20, 20, 20, 20, 20]; 
% A = [1, 20, 40, 80, 100]; 
A = [2, 2, 2, 2, 5]; %amplitude of five vibrations
alpha1 = 0; %phase constant
delta = 0:pi/30:4*pi; %phase difference

t=0; w=pi;

%initialize parameters for 5 vibrations
delta_added = delta+alpha1; %assume alpha1 is a number or a vector with same size of delta
%alpha: 2d array with nth vibration * its phase difference of length(delta)
alpha = zeros(length(A),length(delta_added)); 
for i = 1:length(A)
    alpha(i,:) = alpha1 + (i-1)*delta_added; %calculate alpha values for all 5 vibirations
end


%% set up equations for each vibrations 
fig = figure(1);

%dont have time to debug when making z a 2-dimention array, so although very inefficient, now simply
%listing out 5 vibrations below:
z0 = A(1)*exp(1i*(w.*t+alpha(1,:)));
x0 = real(z0);
y0 = imag(z0);

z1 = A(2)*exp(1i*(w.*t+alpha(2,:)));
x1 = real(z1);
y1 = imag(z1);

z2 = A(3)*exp(1i*(w.*t+alpha(3,:)));
x2 = real(z2);
y2 = imag(z2);

z3 = A(4)*exp(1i*(w.*t+alpha(4,:)));
x3 = real(z3);
y3 = imag(z3);

z4 = A(5)*exp(1i*(w.*t+alpha(5,:)));
x4 = real(z4);
y4 = imag(z4);

%sum of 5
z = z0+z1+z2+z3+z4;
x = real(z);
y = imag(z);

%used later in the second subplot
sum_amplitude_fcn = zeros(length(delta),1);
for i = 1: length(delta)
    sum_amplitude_fcn(i) = (real(z(i))/real(exp(1i*angle(z(i)))))^2;
end


% iterate through the phase difference delta here
% note that each row of alpha matrix and the delta array would have same dimension
for j = 1: length(alpha(2,:))
    %% first subplot: phasor motion on a circle w.r.t delta change
    %depict each non-zero amplitude phasor added as phasors
    sub1 = subplot(1, 2, 1);
    
    %plot the circle
    plot(x, y, 'g--')
    hold on 
    plot(x0, y0, 'b--')
    plot(x1, y1, 'b--')
    plot(x2, y2, 'b--')
    plot(x3, y3, 'b--')
    plot(x4, y4, 'b--')
    hold on 
    %plot the moving vectors
    quiver(0,0,x0(j),y0(j),'b','MaxHeadSize',2,'AutoScale','off')
    text(x0(j),y0(j),'1')
    quiver(0,0,x1(j),y1(j),'b','MaxHeadSize',2,'AutoScale','off')
    text(x1(j),y1(j),'2')
    quiver(0,0,x2(j),y2(j),'b','MaxHeadSize',2,'AutoScale','off')
    text(x2(j),y2(j),'3')
    quiver(0,0,x3(j),y3(j),'b','MaxHeadSize',2,'AutoScale','off')
    text(x3(j),y3(j),'4')
    quiver(0,0,x4(j),y4(j),'b','MaxHeadSize',2,'AutoScale','off')
    text(x4(j),y4(j),'5')
    quiver(0,0,x(j),y(j),'r','MaxHeadSize',2,'AutoScale','off')
    text(x(j),y(j),'sum')
    hold off
    
    %frame parameter
    pbaspect([1 1 1])
    axis([-1*abs(max(A)+max(A)),1*abs(max(A)+max(A)),-1*abs(max(A)+max(A)),1*abs(max(A)+max(A))])
    title('each individual phasor motion & sum of them')
%     set(gca, 'XTickLabel',[], 'YTickLabel', []);
    
    %% second subplot: square of amplitude of summed vibrations vs delta
    sub2 = subplot(1, 2, 2);
    
    %plot points
    plot(delta/pi, sum_amplitude_fcn, 'b--') %the function is pre-calculated outside the loop
    hold on
    sum_amplitude = (real(z(j))/real(exp(1i*angle(z(j)))))^2; %A = z/e^(i*theta)
    plot(delta(j)/pi, sum_amplitude, 'r.')
    
    %frame parameter
    xlabel('\delta (scaled by \pi)') 
    ylabel('square of amplitude') 
    title('square of amplitude of summed vibrations vs \delta')

    
    %% get the amination
    F(i) = getframe(fig);
    
end
















