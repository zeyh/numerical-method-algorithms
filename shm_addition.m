%{
 PHY240 #1.2
 produce a marker that traces the full unit circle (ccw)
 contains 4 subplots show the motion on unit circle, y(theta), x(theta),
 and x,y value on y=-2, x=2.
 1/8/2020
%}
test = linspace(-1,1);

%set up for writing video
video = VideoWriter('test.avi');
open(video);

%function for unit circle centered at (1/2, 0)
theta = 0:0.1:4*pi;
x = 1/2*cos(theta)+1/2;
y = 1/2*sin(theta);


for i = 1:length(theta) %for each frame
    fig = figure(1);
    
    sub1 = subplot(2,2,1);
    plot(x,y) %plot the unit circle
    grid on
    hold on
    point_plot = plot(x(i),y(i),'r*');  %plot the point
    text_tmp = strcat(' (',num2str(round(x(i),2)),',', num2str(round(y(i),2)),')'); %format x,y val
    text(x(i),y(i),text_tmp) %plot the text along the point
    plot([x(i) x(i)],[0 y(i)],'r--') %plot a vertical line
    plot([0.5 x(i)],[0 0],'r--') %plot a horizontal line
    pbaspect([1 1 1]) %scale the plot into 1,1
    title('marker movement on unit circle')
    hold off
    set(gca, 'XTickLabel',[], 'YTickLabel', []);
    
    sub2 = subplot(2,2,2);
    title('y(\theta)') %\ escape theta to be the greek symbol
    grid on
    hold on
    plot(theta(i),y(i),'g*') 
    set(gca, 'XTickLabel',[], 'YTickLabel', []);
    
    sub3 = subplot(2,2,3);
    title('x(\theta)')
    grid on
    hold on
    plot(theta(i),x(i),'g*')
    set(gca, 'XTickLabel',[], 'YTickLabel', []);
    
    sub4 = subplot(2,2,4);
    copyobj(point_plot,sub4)
    x_new = 2;
    y_new = -2;
    
    plot([2 2],[-2.5 1.5],'g--') % x=2
    hold on 
    plot([-1.5 2.5],[-2 -2],'b--') % y=-2
    plot(2,x(i), "r*")
    text(2,x(i), strcat('  x=',num2str(round(x(i),2))))
    plot(y(i),-2, "r*")
    text(y(i),-2, strcat('  y=',num2str(round(y(i),2))))
    hold off 
    axis([-1.5,2.5,-2.5,1.5])
    grid on
    title('x,y value')
    set(gca, 'XTickLabel',[], 'YTickLabel', []);
    
    
    
    
    
    
    F(i) = getframe(fig);
end

% write video named "test.avi" to curr directory
writeVideo(video,F);
close(video);













