clc,clear
a=textread('hua.txt');  %把原始数据按照原来的排列格式存放在纯文本文件hua.txt
a=nonzeros(a'); %按照原来数据的顺序去掉零元素
da=diff(a);      %计算1阶差分
ToEstMd=arima('MALags',1); %指定模型的结构
[EstMd,EstParamCov,logL,info]=estimate(ToEstMd,da); %模型拟合
dx_Forecast=forecast(EstMd,10,'Y0',da)  %计算10步预报值
x_Forecast=a(end)+cumsum(dx_Forecast)   %计算原始数据的10步预测值
