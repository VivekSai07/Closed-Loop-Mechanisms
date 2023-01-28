clc
clearvars;

l1 = 5 ; 
l2 = 8 ; 
l3 = 7 ; 
l4 = 8;

for t = 0:0.01:2
    w2 = pi/6; w2 = rad2deg(w2);
    th2 = w2*t;
    A = sin(th2);
    B = cos(th2) - (l1/l2);
    C = -(l1/l4)*cos(th2) + [((l1)^2 + (l2)^2 + (l4)^2 - (l3)^2)/(2*l2*l4)];
    
    th41 = 2*atan([A-sqrt(A^2+B^2-C^2)]/(B+C));
    th42 = 2*atan([A+sqrt(A^2+B^2-C^2)]/(B+C));
    
    D = -(l1/l3)*cos(th2) + [((l1)^2 + (l2)^2 + (l3)^2 - (l4)^2)/(2*l2*l3)];
    
    th31 = 2*atan([A-sqrt(A^2+B^2-D^2)]/(B+D));
    th32 = 2*atan([A+sqrt(A^2+B^2-D^2)]/(B+D));
    
    Omega4 = (l2*sin(th2-th32)./l4*sin(th41-th32))*w2;
    Omega3 = (l2*sin(th2-th41)./l4*sin(th41-th32))*w2;
    
   
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
    