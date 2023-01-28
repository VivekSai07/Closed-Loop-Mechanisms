clc
clearvars;

l1 = 8 ; % ground link
l2 = 5 ; % crank 
l3 = 7 ; % coupler
l4 = 8 ; % rocker/follower

for t = 0:0.01:1
    omega2 = pi/4; omega2 = rad2deg(omega2);
    th2 = omega2*t;
    alpha2 = 0;
    
    A = sin(th2);
    B = cos(th2) - (l1/l2);
    C = -(l1/l4)*cos(th2) + [((l1)^2 + (l2)^2 + (l4)^2 - (l3)^2)/(2*l2*l4)];
    
    th41 = 2*atan([A-sqrt(A^2+B^2-C^2)]/(B+C));
    th42 = 2*atan([A+sqrt(A^2+B^2-C^2)]/(B+C));
    
    D = -(l1/l3)*cos(th2) + [((l1)^2 + (l2)^2 + (l3)^2 - (l4)^2)/(2*l2*l3)];
    
    th31 = 2*atan([A-sqrt(A^2+B^2-D^2)]/(B+D));
    th32 = 2*atan([A+sqrt(A^2+B^2-D^2)]/(B+D));
    
    A = [l1*cos(th2); l2*sin(th2)];
    B = [l1+l4*cos(th41); l4*sin(th41)];
    
    Omega3 = ((l2*sin(th2-th41))/(l3*sin(th41-th32)))*omega2;
    Omega4 = ((l2*sin(th2-th32))/(l4*sin(th41-th32)))*omega2;
    
    Alpha3 = (l4*Omega4^2-l2*alpha2*sin(th2-th41)-l2*omega2^2*cos(th2-th32)-l3*Omega3^2*cos(th32-th41))/(l3*sin(th32-th41));
    Alpha3 = round(Alpha3);
    Alpha4 = (l2*alpha2*sin(th2-th32)+l2*omega2^2*cos(th2-th32)+l3*Omega3^2+l4*Omega4^2*cos(th41-th32))/(l4*sin(th41-th32));
    Alpha4 = round(Alpha4)
%     
%     subplot(2,1,1)
%     plot(th2,Alpha3);
%     hold on
% 
%     subplot(2,1,2)
    plot([0 l2*cos(th2)],[0 l2*sin(th2)],'o-','linewidth',2); hold on
    plot([0 l1],[0 0],'o-','linewidth',2); hold on
    plot([l1 l1+l4*cos(th41)],[0 l4*sin(th41)],'o-','linewidth',2); hold on
    plot([l2*cos(th2) l2*cos(th2)+l3*cos(pi+th32)],[l2*sin(th2) l2*sin(th2)+l3*sin(pi+th32)],'o-','linewidth',2); hold off
    grid on
    axis(gca,'equal');
    axis([-8 18 -10 10])
    pause(0.1)
    drawnow
end
