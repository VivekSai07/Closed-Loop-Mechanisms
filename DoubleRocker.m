clc; clearvars
l1 = 8 ; % ground link
l2 = 7 ; % crank 
l3 = 3 ; % coupler
l4 = 7 ; % rocker/follower

for t = 0:0.01:1
    omega3 = pi/4; omega3 = rad2deg(omega3);
    th3 = omega3*t;
    alpha3 = diff(omega3);
    
    A = 2*l3*l4*sin(th3);
    B = 2*l1*l4 + 2*l4*l3*cos(th3);
    C = (l2)^2 - [(l1)^2 + (l3)^2 + (l4^2) + 2*l1*l3*cos(th3)];
    
    th41 = 2*atan([A-sqrt(A^2+B^2-C^2)]/(B+C));
    th42 = 2*atan([A+sqrt(A^2+B^2-C^2)]/(B+C));
    
    D = 2*l2*l3*sin(th3);
    E = 2*l1*l2 + 2*l2*l3*cos(th3);
    F = (l1)^2 + (l2)^2 + (l3^2) - (l4)^2 + 2*l1*l3*cos(th3);
    
    th21 = 2*atan([D-sqrt(D^2+E^2-F^2)]/(E+F));
    th22 = 2*atan([D+sqrt(D^2+E^2-F^2)]/(E+F));
    
    Omega2 = ((l3*sin(th3-th42))/(l4*sin(th22-th42)))*omega3;
    Omega4 = ((l3*sin(th3-th22))/(l4*sin(th42-th22)))*omega3;
    
    alpha2 = (l4*Omega4^2-l2*Omega2^2-l3*omega3^2*sin(th3-th42))/(l2*sin(th22-th42));
    alpha4 = (l2*Omega2^2+l3*omega3^2*cos(th3-th22)-l4*Omega4^2*cos(th42-th22))/(l4*sin(th42-th22));
    
    plot([0 l2*cos(th22)],[0 l2*sin(th22)],'o-','linewidth',2); hold on
    plot([0 l1],[0 0],'o-','linewidth',2); hold on
    plot([l1 l1+l4*cos(th42)],[0 l4*sin(th42)],'o-','linewidth',2); hold on
    plot([l2*cos(th22) l2*cos(th22)+l3*cos(pi+th3)],[l2*sin(th22) l2*sin(th22)+l3*sin(pi+th3)],'o-','linewidth',2); hold off

    grid on
    axis(gca,'equal');
    axis([-8 18 -10 10])
    pause(0.1)
    drawnow
end