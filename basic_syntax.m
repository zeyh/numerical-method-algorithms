%{
matlab syntax intro
Chap 2 HW, #11
Sep 4, 19
%}

% 
% %original ---------------------------------------
% U = [1,0,-1,0; 0,1,0,-1];
% theta = pi/4;
% fill(U(1,:), U(2,:),'r')
% 
% hold on
% axis([-2 2 -2 2])
% R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
% V = R*U;
% 
% fill(V(1,:), V(2,:), 'b');
% axis equal tight, grid on
% 
% %a ---------------------------------------
% for i = 0:3
%     U = [5,6,4; 0,2,1];
%     theta = i*pi/2;
%     R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
%     V = R*U;
%     fill(V(1,:), V(2,:), 'g');
%     hold on
% end
% axis equal tight, grid on
% hold off
% 
% %b ---------------------------------------
% for i = 3:4
%     U = [1,0,-1,0; 0,1,0,-1];
%     theta = pi./4;
%     R1 = [cos(theta) -sin(theta); sin(theta) cos(theta)];
%     theta1 = -pi./4;
%     R2 = [cos(theta1) -sin(theta1); sin(theta1) cos(theta1)];
%     V = R1*R2*U;
%     fill(V(1,:), V(2,:), 'b');
%     hold on
% end
% axis equal tight, grid on
% hold off
% 
% %c ---------------------------------------
% for theta = -1e5:1e5
%     original = [cos(theta) -sin(theta); sin(theta) cos(theta)];
%     negative = [cos(-theta) -sin(-theta); sin(-theta) cos(-theta)];
%     %through the property
%     negative2 = [cos(theta) sin(theta); -sin(theta) cos(theta)];
% %     disp(original*negative); 
% %     disp(original*negative2);
%     if original*negative ~= original*negative2
%         fprintf("fails")
%     end
% end
% % %{
% %     1     0
% %     0     1
% % 
% %      1     0
% %      0     1
% % because the original*negative and original*negative2 are the same
% % and leads to the identity matrix
% % R(theta) and R(-theta) are inverses pf each other for theta after looping
% % through theta for a wide range
% % %}
% 
% 
% %d ---------------------------------------
% theta = pi/8;
% U = [1,0,-1,0; 0,1,0,-1];
% for i = 0:50
%     R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
%     V = R*U;
%     fill(V(1,:), V(2,:), [1 i/52 i/52]);
%     hold on
%     theta = 0.9*theta;
% end
% axis equal tight, grid on
% hold off
% 
% %e ---------------------------------------
% theta = pi/8;
% U = [1,0,-1,0; 0,1,0,-1];
% step = [1,1,1,1;2,2,2,2];
% for i = 0:50
%     R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
%     V = R*U;
%     V = V+i*step;
%     theta = 0.9*theta;
%     fill(V(1,:), V(2,:), [1 i/52 i/52]);
%     hold on 
% end
% axis equal tight, grid on
% hold off

% another ver using ployshape.......
theta = pi/8;
U = polyshape([1,0,-1,0],[ 0,1,0,-1]);
for i = 0:50
    poly2 = translate(U,i.*[1 2]);
    poly1 = rotate(poly2,0.9.^i*rad2deg(theta));
    plot(poly2)
    hold on
    
end
% plot(plot_ls)
axis equal
hold off







