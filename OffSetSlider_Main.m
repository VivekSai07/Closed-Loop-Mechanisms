clc; clearvars

r2 = 3;
r3 = 7;
r4 = 0;
th1 = 0;
th4 = pi/2;

for t = 0:0.01:1
   omega2 = pi/4; omega2 = rad2deg(omega2);
   th2 = omega2*t;
    
   A = 2*(r4*cos(th1)*cos(th4)-r2*cos(th1)*cos(th2)+r4*sin(th1)*sin(th4)-r2*sin(th1)*sin(th2));
   B = (r4)^2 + (r2)^2 - (r3)^2 - 2*r2*r4*cos(th2)*cos(th4) - 2*r2*r4*sin(th2)*sin(th4);

   r11 = (-A+sqrt(A^2 - 4*B))/2;
   r12 = (-A-sqrt(A^2 - 4*B))/2;
   
   th3 = atan((r11*sin(th1)+r4*sin(th4)-r2*sin(th2))/(r11*cos(th1)+r4*cos(th4)-r2*cos(th2)));
   
   A = [cos(th1) r3*sin(th3);sin(th1) -r3*cos(th3)];
   B = [-r2*omega2*sin(th2);r2*omega2*cos(th2)];
   X = inv(A)*B;
   Velocity = X(1,1);
   Ang_Vel_3 = X(2,1);
   
   Slider_Pos = [r11 0]
   
   plot([0 r2*cos(th2)],[0 r2*sin(th2)],'o-','linewidth',2); hold on
%    plot([0 r11*cos(th1)],[0 r11*sin(th1)],'o-','linewidth',2); hold on
%    plot([r11*cos(th1) r11*cos(th1)+r4*cos(th4)],[r11*sin(th1) r4*sin(th4)],'o-','linewidth',2); hold on
   plot([r2*cos(th2) r11*cos(th1)+r4*cos(th4)],[r2*sin(th2) r4*sin(th4)],'o-','linewidth',2); hold on
   plot(r11*cos(th1)+r4*cos(th4),r4*sin(th4),'s','linewidth',2,'MarkerSize',15);
   hold off;
   
   grid on
    axis(gca,'equal');
    axis([-5 20 -5 10])
    pause(0.1)
    drawnow
end