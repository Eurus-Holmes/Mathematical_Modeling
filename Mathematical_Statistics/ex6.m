% .  P131 . 例7.6  Q-Q图
clc,clear
a=textread('ex7_5.txt');a=nonzeros(a); %读入数据，并去掉多余的零展成列向量
xbar=mean(a),s=std(a) % 求均值和标准差
pd = fitdist(a,'Normal') %定义正态分布
qqplot(a,pd) %Matlab工具箱直接画Q-Q图
%下面不利用工具箱画Q-Q图
sa=sort(a); %把a按照从小到大排列
n=length(a);pi=([1:n]-1/2)/n;
yi=norminv(pi,xbar,s)' %计算对应的yi值
hold on,plot(yi,sa,'.') %重新描点画Q-Q图