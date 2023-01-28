clc
clear all
close all

l1=360;
l2=90;
l4=180;
l3=sqrt(l1^2+l2^2-l4^2);
l5=450/(cos(pi/3));
th4star = 2*asin(l2/l4);
th4star_degree=th4star*180/pi;
th2=0:5*pi/180:2*pi*6;

th4m=nan(size(th2));

for j=1:length(th2)
    a=sin(th2(j));
    b=l1/l2+cos(th2(j));
    c=(l1^2+l2^2-l3^2+l4^2)/(2*l2*l4)+l1/l4*cos(th2(j));
    th4m(j)=2*atan((a-(a^2+b^2-c^2)^0.5)/(b+c));
end

th5m=nan(size(th2));

for j=1:length(th2)
    a=sin(th2(j));
    b=l1/l2+cos(th2(j));
    c=(l1^2+l2^2-l3^2+l4^2)/(2*l2*l4)+l1/l4*cos(th2(j));
    th5m(j)=pi+2*atan((a-(a^2+b^2-c^2)^0.5)/(b+c));
end


th3m=nan(size(th2));

for j=1:length(th2)
    a=sin(th2(j));
    b=l1/l2+cos(th2(j));
    c=-((l1^2+l2^2+l3^2-l4^2)/(2*l2*l4)+l1/l3*cos(th2(j)));
    th3m(j)=2*atan((a-(a^2+b^2-c^2)^0.5)/(b+c));
end

%%
startwipe_degree=(min(th5m))*180/pi;
endwipe_degree=(max(th5m))*180/pi;
strartwipe_radian=min(th5m);
delth5=(pi/3)-strartwipe_radian;


for j=1:length(th2)
    a=sin(th2(j));
    b=l1/l2+cos(th2(j));
    c=(l1^2+l2^2-l3^2+l4^2)/(2*l2*l4)+l1/l4*cos(th2(j));
    th5m(j)=pi+2*atan((a-(a^2+b^2-c^2)^0.5)/(b+c))+delth5;
end
fprintf('length of l1: %1.f mm\n',l1)
fprintf('length of l2: %1.f mm\n',l2)
fprintf('length of l3: %1.f mm\n',l3)
fprintf('length of l4: %1.f mm\n',l4)
fprintf('angle difference between l4 and l5: %f(degree)\n',-delth5*180/pi)

for j=1: length(th2)
    O2x=0;
    O2y=0;
    Ax=O2x+l2*cos(th2(j));
    Ay=O2y+l2*sin(th2(j));
    
%     Bx=Ax+l3*cos(th3m(j));
%     By=Ay+l3*sin(th3m(j));
%     
    O4x=-l1;
    O4y=0;
    
    Cx=O4x+l5*cos(th5m(j));
    Cy=O4x+l5*sin(th5m(j));
%     Dx=-200+O4x+l5*cos(th5m(j));
%     Dy=O4x+l5*sin(th5m(j));
    
    Dx=-200+O4x+l5*cos(th5m(j));
     Dy=O4x+l5*sin(th5m(j));
    

    Bx=O4x;
    By=0;
    
    O5x=-200+O4x;
    O5y=0;
    
    W1x=Cx;
    W1y=Cy+400;
    
    W2x=Cx;
    W2y=Cy-400;

    xtemp=[O2x Ax Bx  Cx Dx  O5x];
    ytemp=[O2y Ay By  Cy Dy  O5y];
  
    plot(xtemp,ytemp,'bo-','linewidth',2);
    title ('wiper mechanism');
    grid on;
    xlabel('X (cm)');
    ylabel('y (cm)');
    ylim([-500 , 1600])
    axis equal;
    pause(0.0000001);
end
    