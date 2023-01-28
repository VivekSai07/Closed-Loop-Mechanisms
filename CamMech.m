
clc; clearvars;
r1 = 1;
r2 = 0.5;

for th2 = 0:0.1:4*pi
    
    % point B
    B = [0.356 0.356];
    % point A
    A = [0.356+r2*cos(th2) 0.356+r2*sin(th2)];
    % point D
    r3 = r2*cos(th2) + r1;
    D = [0.356+r3 0.356];
    
    crank = line([B(1) A(1)],[B(2) A(2)]);
    tangent = line([0.356+r3 0.356+r3],[-1 1.5],'linewidth',2);
    tangentOffset = line([0.356+r3+0.5 0.356+r3+0.5],[-1 1.5],'linewidth',2);
    sliderLine1 = line([0.356+r3+0.5 0.356+r3+3.5],[0.6 0.6],'linewidth',2); 
    sliderLine2 = line([0.356+r3+0.5 0.356+r3+3.5],[0.1 0.1],'linewidth',2);
    sliderEndclose = line([0.356+r3+3.5 0.356+r3+3.5],[0.1 0.6],'linewidth',2);
    
    tangentTopEnd = line([0.356+r3 0.356+r3+0.5],[1.5 1.5],'linewidth',2);
    tangentBottomEnd = line([0.356+r3 0.356+r3+0.5],[-1 -1],'linewidth',2);
    slidersptop = line([3 4],[0.7 0.7],'linewidth',2);
    sliderspbt = line([3 4],[0 0],'linewidth',2);
    
    pointA = viscircles(B,0.01);
    pointB = viscircles(A,1);
    pointD = viscircles(D,0.01);
    grid on
    pause(0.01);
    
    delete(pointA);
    delete(pointB);
    delete(pointD);
    delete(crank);
    delete(tangent);
    delete(tangentOffset);
    delete(sliderLine1);
    delete(sliderLine2);
    delete(sliderEndclose);
    delete(tangentTopEnd);
    delete(tangentBottomEnd);
    delete(slidersptop);
    delete(sliderspbt);
    grid on

    axis(gca,'equal');
    axis([-3 8 -5 5])
end