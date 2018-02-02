clc, clear
a=textread('ex7_5.txt'); a=nonzeros(a); %读入数据，去掉多余的零并展开成列向量
xbar=mean(a), s=std(a), s2=var(a) %求均值, 标准差和方差
[yn,xn]=cdfcalc(a);  %计算经验分布函数值
yn(end)=[];  %yn的元素个数比xn多了一个，删除最后一个值
y=normcdf(xn,xbar,s); %计算理论分布函数值
Dn=max(abs(yn-y))  %计算统计量的值
LJ=1.36/sqrt(length(a)) %计算拒绝域的临界值
%以下直接调用Matlab工具箱的命令进行KS检验
pd=makedist('Normal','mu',xbar,'sigma',s)
[h,p,st]=kstest(a,'CDF',pd) %直接调用工具箱的命令进行KS检验
