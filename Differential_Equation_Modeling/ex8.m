% .  P116 . 例6.5 . 求解线性常微分方程组 非齐次线性方程组
clc,clear
syms x(t) y(t) z(t) %定义符号变量
X=[x;y;z];A=[1 0 0;2 1 -2;3 2 1];B=[0;0;exp(t)*cos(2*t)];
X0=[0;1;1]; %初值条件
X=dsolve(diff(X)==A*X+B,X(0)==X0) %求符号解
X=simplify([X.x;X.y;X.z]) %显示解的各个分量
pretty(X) %分数线居中的显示方式

%或者...
syms t s
a=[1,0,0;2,1,-2;3,2,1];fs=[0;0;exp(s)*cos(2*s)];
x0=[0;1;1];
tx=int(expm(a*(t-s))*fs,s);  %先求不定积分
xstar=subs(tx,s,t)-subs(tx,s,0); %再求定积分，这样运行速度快
x=expm(a*t)*x0+xstar;
x=simplify(x), pretty(x)
