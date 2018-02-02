clc,clear
VarMd=garch('Constant',0.01,'GARCH',0.2,'ARCH',0.3); %指定模型的结构
Md=arima('Constant',0,'AR',0.8,'MA',0.4, 'Variance',VarMd); %指定模型的结构
[y,e,v]=simulate(Md,10000); %产生指定结构模型的10000个模拟数据
ToEstVarMd=garch(1,1);
ToEstMd=arima('ARLags',1,'MALags',1,'Constant',0,'Variance',ToEstVarMd);
[EstMd,EstParamCov,logL,info]=estimate(ToEstMd,y)  %模型拟合
res=infer(EstMd,y); %计算残差
h=lbqtest(res) %进行模型检验
yhat=forecast(EstMd,3,'Y0',y) %预测未来的3个值
