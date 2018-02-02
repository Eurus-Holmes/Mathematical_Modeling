clc, clear
syms g t(h) %定义符号常量和变量
t=dsolve(diff(t)==10000*pi/sqrt(2*g)*(h^(3/2)-2*h^(1/2)),t(1)==0) %求符号解
t=simplify(t) %化简
pretty(t) %分数线居中的显示方式