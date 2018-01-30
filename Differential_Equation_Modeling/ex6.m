% .  P115 . 例6.3 . 求解常微分方程组
clc,clear
syms f(x) g(x) %定义符号变量
df=diff(f); %定义f的一阶导数，用于初值或边值条件的赋值
[f1,g1]=dsolve(diff(f,2)+3*g==sin(x),diff(g)+df==cos(x)) %求通解
f1=simplify(f1),g1=simplify(g1) %对符号解进行化简
[f2,g2]=dsolve(diff(f,2)+3*g==sin(x),diff(g)+df==cos(x),df(2)==0,f(3)==3,g(5)==1)
f2=simplify(f2),g2=simplify(g2) %对符号解进行化简

%或者...
equ1='D2f+3*g=sin(x)';
equ2='Dg+Df=cos(x)';
[general_f,general_g]=dsolve(equ1,equ2,'x')  %求通解
[f,g]=dsolve(equ1,equ2,'Df(2)=0,f(3)=3,g(5)=1','x')
