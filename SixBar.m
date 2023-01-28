clc
clearvars;

l1 = 8 ; % ground link
l2 = 5 ; % crank 
l3 = 7 ; % coupler
l4 = 8 ; % rocker/follower
l5 = 7 ;
l6 = 7 ;
l7 = 5 ;

for t = 0:0.01:1
    omega2 = pi/4; omega2 = rad2deg(omega2);
    th2 = omega2*t;
    A = sin(th2);
    B = cos(th2) - (l1/l2);
    C = -(l1/l4)*cos(th2) + [((l1)^2 + (l2)^2 + (l4)^2 - (l3)^2)/(2*l2*l4)];
    
    th41 = 2*atan([A-sqrt(A^2+B^2-C^2)]/(B+C));
    th42 = 2*atan([A+sqrt(A^2+B^2-C^2)]/(B+C));
    
    D = -(l1/l3)*cos(th2) + [((l1)^2 + (l2)^2 + (l3)^2 - (l4)^2)/(2*l2*l3)];
    
    th31 = 2*atan([A-sqrt(A^2+B^2-D^2)]/(B+D));
    th32 = 2*atan([A+sqrt(A^2+B^2-D^2)]/(B+D));
    
    E = sin(th41);
    F = cos(th41) - (l7/l4);
    G = -(l7/l6)*cos(th41) + [((l7)^2 + (l4)^2 + (l6)^2 - (l5)^2)/(2*l4*l6)];
     
    th61 = 2*atan([E-sqrt(E^2+F^2-G^2)]/(F+G)); 
    th62 = 2*atan([E+sqrt(E^2+F^2-G^2)]/(F+G));

    M = -(l7/l5)*cos(th41) + [((l7)^2 + (l4)^2 + (l5)^2 - (l6)^2)/(2*l4*l5)];
     
    th51 = 2*atan([E-sqrt(E^2+F^2-M^2)]/(F+M)); 
    th52 = 2*atan([E+sqrt(E^2+F^2-M^2)]/(F+M));
    
    plot([0 l2*cos(th2)],[0 l2*sin(th2)],'o-','linewidth',2); hold on
    plot([0 l1],[0 0],'o-','linewidth',2); hold on
    plot([l1 l1+l4*cos(th41)],[0 l4*sin(th41)],'o-','linewidth',2); hold on
    plot([l2*cos(th2) l2*cos(th2)+l3*cos(pi+th32)],[l2*sin(th2) l2*sin(th2)+l3*sin(pi+th32)],'o-','linewidth',2); 
    hold on
    plot([l1 l1+l7],[0 0],'o-','linewidth',2);
    hold on
    plot([l1+l4*cos(th41) l1+l7+l6*cos(th61)],[l4*sin(th41) l6*sin(th61)],'o-','linewidth',2);
    hold on
    plot([l1+l7 l1+l7+l6*cos(th61)],[0 l6*sin(th61)],'o-','linewidth',2);
    hold off
    grid on
    axis(gca,'equal');
    axis([-8 18 -10 10])
    pause(0.1)
    drawnow
end
