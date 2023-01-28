clc; clearvars
l1 = 5 ; % ground link
l2 = 8 ; % crank 
l3 = 7 ; % coupler
l4 = 8 ; % rocker/follower
l5 = 15;

for t = 0:0.01:2
    omega = pi/4; omega = rad2deg(omega);
    th2 = omega*t;
    A = sin(th2);
    B = cos(th2) - (l1/l2);
    C = -(l1/l4)*cos(th2) + [((l1)^2 + (l2)^2 + (l4)^2 - (l3)^2)/(2*l2*l4)];
    
    th41 = 2*atan([A-sqrt(A.^2+B.^2-C.^2)]./(B+C));
    th42 = 2*atan([A+sqrt(A.^2+B.^2-C.^2)]./(B+C));
    
    D = -(l1/l3)*cos(th2) + [((l1)^2 + (l2)^2 + (l3)^2 - (l4)^2)/(2*l2*l3)];
    
    th31 = 2*atan([A+sqrt(A.^2+B.^2-D.^2)]./(B+D));
    th32 = 2*atan([A-sqrt(A.^2+B.^2-D.^2)]./(B+D));
    
    th5 = asin((-l4*sin(th41))/l5);
    
    SliderPos = [l1+l4*cos(th41)+l5*cos(th5),0];
    SliderPos(1,1)
    
    plot([0 l2*cos(th2)],[0 l2*sin(th2)],'o-','linewidth',2); hold on
    plot([0 l1],[0 0],'o-','linewidth',2); hold on
    plot([l1 l1+l4*cos(th41)],[0 l4*sin(th41)],'o-','linewidth',2); hold on
    plot([l2*cos(th2) l2*cos(th2)+l3*cos(pi+th31)],[l2*sin(th2) l2*sin(th2)+l3*sin(pi+th31)],'o-','linewidth',2); hold on
    
    plot([l1 l1+l4*cos(th41)+l5*cos(th5)],[0 0],'o-','linewidth',2); hold on
    plot([l1+l4*cos(th41) l1+l4*cos(th41)+l5*cos(th5)],[l4*sin(th41) 0],'o-','linewidth',2); hold on
    plot(l1+l4*cos(th41)+l5*cos(th5),0,'s','linewidth',10); hold off
    grid on
    title('Quick-Return Mechanism')
    axis(gca,'equal');
    axis([-10 30 -10 10])
    pause(0.1)
end