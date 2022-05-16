close;
clear;

MAX = 1000000;
x=0:0.01:1;
y=2*sin(pi*x);
dx=zeros(1,MAX);
dy=zeros(1,MAX);
num = 0;
for i = 1:MAX
    dx(i)=rand;
    dy(i)=rand*2;
    if dy(i) <= 2*sin(pi*dx(i))
        num = num+1;
    else
        dx(i)=0;
        dy(i)=0;
    end
end

plot(x, y);
hold on;
scatter(dx,dy,1);
title('Integration');
daspect([3 2 1])

S = num/MAX * (1*2)
% P=num/MAX * 4;
axis square