clc, clear
ToEstVarMd=garch(1,1);
%ToEstMd=arima('ARLags',1:2,'Variance',ToEstVarMd); %AR的阶次取2，无法通过
ToEstMd=arima('ARLags',1,'Variance',ToEstVarMd);
y=load('mydata.txt');
[EstMd,EstParamCov,logL,info]=estimate(ToEstMd,y')  %模型拟合,注意y为列向量
yhat=forecast(EstMd,3,'Y0',y') %计算3个预测值
