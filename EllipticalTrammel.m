clc; clearvars; clf
r3 = 5;
r4 = 10;

for t = 0:0.01:1
    Omega3 = pi/6; Omega3 = rad2deg(Omega3); 
    th3 = Omega3*t;
    subplot(2,1,1)
    plot([0 0],[0 r3*sin(th3)],'o-','linewidth',2);
    hold on
    plot([r3*cos(th3) 0],[0 0],'o-','linewidth',2);
    hold on
    plot([r3*cos(th3) 0],[0 r3*sin(th3)],'s-','linewidth',2,'MarkerSize',15);
    hold on
    plot([r4*cos(th3) 0],[(r3-r4)*sin(th3) r3*sin(th3)],'o-','linewidth',2);
    hold off
    
    axis(gca,'equal')
    axis([-20 20 -10 10])
    
    pause(0.01)
    subplot(2,1,2)
    plot([r4*cos(th3) 0],[(r3-r4)*sin(th3) 0],'o-','linewidth',2,'color','w','MarkerEdgeColor','b','MarkerSize',1);
    hold on
    axis(gca,'equal')
    axis([-20 20 -10 10])
        
end

