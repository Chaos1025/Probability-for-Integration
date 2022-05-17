close;
clear;

syms z
a = -1;
b = 1;
MAX = 1000000;
% 使用Matlab自带的积分函数验证
S = int(fun(z),a,b)
% 平均值法
sum = 0;
for i = 1:MAX
    dx = rand*(b-a)+a;
    dy = fun(dx);
    sum = sum + dy;
end
S_AvgVal = sum/MAX * (b-a)

% 随机投点法
dx=zeros(1,MAX);
dy=zeros(1,MAX);
num = 0;
for i = 1:MAX
    dx(i)=rand;
    dy(i)=rand*2;
    if dy(i) <= fun(dx(i))
        num = num+1;
    else
        dx(i)=0;
        dy(i)=0;
    end
end
S_RdmPnt = num/MAX * (1*2)

% 被积函数
function y = fun(x)
y = 2*x.^2+sin(pi*x)-x.^5;
end