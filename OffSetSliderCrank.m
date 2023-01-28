clc; clearvars;
l2 = 5; l3 = 25;
e = 2;

for t = 0:0.01:1
    omega2 = pi/4; omega2 = rad2deg(omega2);
    th2 = omega2*t;
    
    th31 = + (acos((1/l3)*sqrt((l3)^2-(e+l2*sin(th2))^2)));
    th32 = - (acos((1/l3)*sqrt((l3)^2-(e+l2*sin(th2))^2))+pi);
    
    xa = l2*cos(th2); ya = l2*sin(th2);
    
    plot([0 xa],[0 ya],'o-','linewidth',2); hold on;
    
    plot([-(l2+l3) (l2+l3)],[e e],'b-','linewidth',2); hold on;
    
    
    plot([xa l2*cos(th2)+l3*cos(th31)],[ya e],'ro-','linewidth',2); 
    hold on
    plot([0 l2*cos(th2)+l3*cos(th31)],[0 e],'s','linewidth',2,'MarkerSize',15);
    hold off;
    
    grid on
    
    axis(gca,'equal')
    axis([-(l2+l3+5) (l2+l3+5) -8 8]);
    pause(0.1);
    
end
    