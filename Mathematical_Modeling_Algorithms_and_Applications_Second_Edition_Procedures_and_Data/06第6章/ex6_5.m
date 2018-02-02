clc,clear
syms x(t) y(t) z(t) %定义符号变量
X=[x;y;z]; A=[1,0,0;2,1,-2;3,2,1];B=[0;0;exp(t)*cos(2*t)];
X0=[0;1;1]; %初值条件
X=dsolve(diff(X)==A*X+B,X(0)==X0) %求符号解
X=simplify([X.x;X.y;X.z]) %显示解的各个分量
pretty(X) %分数线居中的显示方式