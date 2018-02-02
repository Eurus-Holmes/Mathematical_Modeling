clc, clear
syms x(t) y(t) z(t) %定义符号变量
X=[x; y; z]; %定义符号向量
A=[2 1 3;0 2 -1;0 0 2]; B=[1 2 1]';
[x,y,z]=dsolve(diff(X)==A*X,X(0)==B)