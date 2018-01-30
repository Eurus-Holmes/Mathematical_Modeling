% .     P113 .  美国人口的预报模型  线性最小二乘法 向前差分
clc, clear
a=textread('data4.txt'); %把原始数据保存在纯文本文件data4.txt中
x=a([2:2:6],:)'; x=nonzeros(x);
t=[1790:10:2000]';
a=[ones(21,1), -x(1:end-1)]; 
b=diff(x)./x(1:end-1)/10;
cs=a\b;
r=cs(1), xm=r/cs(2)
