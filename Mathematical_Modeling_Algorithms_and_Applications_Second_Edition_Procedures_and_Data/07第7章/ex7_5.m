clc, clear
a=textread('ex7_5.txt'); a=nonzeros(a); %读入数据，并去掉多余的零展成列向量
[ycdf,xcdf,n]=cdfcalc(a) %计算经验分布函数的取值
cdfplot(a), title('') %画经验分布函数的图形
hold on, plot(xcdf,ycdf(2:end),'.') %再重新画经验分布函数的取值
xlswrite('ex7_5.xls',[xcdf,ycdf(2:end)])
