clc, clear
randn('seed',sum(100*clock));  %初始化随机数发生器
a=randn(6,1); %生成服从标准正态分布的伪随机数
b=[today:today+5]'  %从今天到后面5天
fts=fints(b,a)  %生长fints格式数据
fts(3)=NaN;  %将第3个数据变为缺失值NaN
newdata=fillts(fts,'linear') %用线性插值填补时间序列中的缺失数据
data=fts2mat(newdata) %时间序列数据转成普通数据
