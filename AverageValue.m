close;
clear;

syms z
a = 0;
b = 1.2;
MAX = 1000000;
% 使用Matlab自带的积分函数验证
S_real = double(int(fun(z),a,b))
sigma = (b-a)*int(fun2(z),a,b)/(int(fun(z),a,b))^2;
error = double(sqrt((sigma-1)/MAX))
% 平均值法
sum = 0;
for i = 1:MAX
    dx = rand*(b-a)+a;
    dy = fun(dx);
    sum = sum + dy;
end
S_AvgVal = sum/MAX * (b-a)
realError1 = abs((S_AvgVal-S_real)/S_real);

% 随机投点法
dx=zeros(1,MAX);
dy=zeros(1,MAX);
num = 0;
M=5;
for i = 1:MAX
    dx(i)=rand*(b-a)+a;
    dy(i)=rand*M;
    if dy(i) <= fun(dx(i))
        num = num+1;
    else
        dx(i)=0;
        dy(i)=0;
    end
end
S_RdmPnt = num/MAX * ((b-a)*M)
realError2 = abs((S_RdmPnt-S_real)/S_real);

m = a:0.01:b;
n = fun(m);
% plot(m,n)

% 被积函数
function y = fun(x)
y = 2*x.^2+sin(pi*x)+x.^5;
end

function y = fun2(x)
y = fun(x)^2;
end