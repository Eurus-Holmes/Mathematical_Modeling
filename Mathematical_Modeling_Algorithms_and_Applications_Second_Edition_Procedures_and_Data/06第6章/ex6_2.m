clc, clear
syms y(x) %定义符号变量
dy=diff(y); d2y=diff(y,2); %定义一阶导数和二阶导数，用于初值或边值条件的赋值
y=dsolve(diff(y,3)-diff(y,2)==x,y(1)==8,dy(1)==7,d2y(2)==4)
y=simplify(y) %把计算结果化简