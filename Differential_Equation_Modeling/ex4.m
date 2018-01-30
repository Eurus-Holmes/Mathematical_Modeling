% .    P114 .  例6.1 . 求解常微分方程的通解
clc,clear
syms y(x) %定义符号变量
dsolve(x^2+y+(x-2*y)*diff(y)==0)
