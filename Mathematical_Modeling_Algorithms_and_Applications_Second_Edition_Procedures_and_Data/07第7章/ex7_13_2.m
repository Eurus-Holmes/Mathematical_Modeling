clc, clear
a=[18.2  9.5  12.0  21.1  10.2]; %输入原始样本
b=bootstrp(1000,@(x)quantile(x,0.5),a) %计算各个bootstrap样本的中位数
c=std(b)  %计算中位数标准差
