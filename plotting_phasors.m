%{
 PHY240 #1.3
 plotting phasors
 1/9/2020
%}
%%
clear all;
close all;
%parameters
maxtime = 2;
period_factor = 4;
t = 0:maxtime/(period_factor*15):maxtime;
%T = 2pi/w
A1 = 1; A2 = 2; alpha1 = pi; alpha2 = 1.8*pi; w=pi*period_factor;

%define z1 and z2
z1 = A1*exp(1i*(w.*t+alpha1));
z2 = A2.*exp(1i*(w.*t+alpha2));
theta1 = angle(z1);
theta2 = angle(z2);
% disp(theta1)

%plotting
fig = figure(1);

for i = 1:length(t)
    %% z1
    sub1 = subplot(3,2,1);
    %plot unit circle
    x = A1*sin(theta1);
    y = A1*cos(theta1);
    plot(x,y)
    %frame parameter
    pbaspect([1 1 1])
    axis([-1*abs(A1+2),1*abs(A1+2),-1*abs(A1+2),1*abs(A1+2)])
    title(strcat('Z1: ',' A1 = ',num2str(A1), ' , alpha1 = ', num2str(alpha1)))
    %plot the moving vector 
    hold on
    plot(x(i),y(i))
    quiver(0,0,x(i),y(i),'r','MaxHeadSize',2,'AutoScale','off')
    hold off
    
    sub2 = subplot(3,2,2);
    %frame parameter
    xlabel('time') 
    ylabel('y-component') 
    axis([0,maxtime,-3,3])
    %plot the complex exponential form directly
    plot(t, real(z1), 'b--')
    plot(t(i),real(z1(i)),'r.')
    hold on
    
    
    %% z2
    sub3 = subplot(3,2,3);
    %define the circle
    x1 = A2*sin(theta2);
    y1 = A2*cos(theta2);
    %plot moving points
    plot(x1,y1)
    hold on
    plot(x1(i),y1(i))
    quiver(0,0,x1(i),y1(i),'r','MaxHeadSize',2,'AutoScale','off')
    hold off
    %frame parameters
    pbaspect([1 1 1])
    axis([-1*abs(A2+2),1*abs(A2+2),-1*abs(A2+2),1*abs(A2+2)])
    title(strcat('Z2: ',' A2 = ',num2str(A2), ' , alpha2 = ', num2str(alpha2)))
    
    sub4 = subplot(3,2,4);
    %frame parameters
    xlabel('time') 
    ylabel('y-component') 
    axis([0,maxtime,-1*abs(A2+2),1*abs(A2+2)])
    %plot line
    plot(t, real(z2), 'b--')
    hold on
    plot(t(i),real(z2(i)),"r.")
    
    
    %% z1+z2
    
    sub5 = subplot(3,2,5);
    z3 = z1+z2;
    theta3 = angle(z3);
    %define the circle
    x2 = (A2)*sin(theta3);
    y2 = (A2)*cos(theta3);
    %plot the circle
    plot(x2,y2)
    hold on
    quiver(x(i),y(i),x1(i)-x(i),y1(i)-y(i),'r','MaxHeadSize',2,'AutoScale','off')
    quiver(0,0,x(i),y(i),'r','MaxHeadSize',2,'AutoScale','off')
    quiver(0,0,x1(i),y1(i),'r','MaxHeadSize',2,'AutoScale','off')
    hold off
    %frame parameters
    pbaspect([1 1 1])
    axis([-1*abs(A2+2),1*abs(A2+2),-1*abs(A2+2),1*abs(A2+2)])
    title(strcat('Z1+Z2', ' , delta = ', num2str(-1*alpha2)))
    
    
    sub6 = subplot(3,2,6);
    %frame parameters
    xlabel('time') 
    ylabel('y-component') 
    axis([0,maxtime,-1*abs(A2+2),1*abs(A2+2)])
    %plot curve
    plot(t, real(z1+z2), 'b--')
    hold on
    plot(t(i),real(z1(i)+z2(i)),"r.")
    
    F(i) = getframe(fig);
    
    
end







