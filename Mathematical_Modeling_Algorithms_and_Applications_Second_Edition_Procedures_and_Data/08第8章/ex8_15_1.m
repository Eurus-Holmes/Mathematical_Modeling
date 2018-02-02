clc,clear
a=textread('hua.txt');  %把原始数据按照原来的排列格式存放在纯文本文件hua.txt
a=nonzeros(a'); %按照原来数据的顺序去掉零元素
r11=autocorr(a)   %计算自相关函数
r12=parcorr(a)   %计算偏相关函数
da=diff(a);      %计算1阶差分
r21=autocorr(da)  %计算自相关函数
r22=parcorr(da)   %计算偏相关函数
n=length(da);  %计算差分后的数据个数
k=0; %初始化试探模型的个数
for i=0:3
    for j=0:3
        if i==0 & j==0
            continue
        elseif i==0
            ToEstMd=arima('MALags',1:j,'Constant',0); %指定模型的结构
        elseif j==0
            ToEstMd=arima('ARLags',1:i,'Constant',0); %指定模型的结构
        else
            ToEstMd=arima('ARLags',1:i,'MALags',1:j,'Constant',0); %指定模型的结构
        end
        k=k+1; R(k)=i; M(k)=j;
        [EstMd,EstParamCov,logL,info]=estimate(ToEstMd,da); %模型拟合
        numParams = sum(any(EstParamCov)); %计算拟合参数的个数
        %compute Akaike and Bayesian Information Criteria
        [aic(k),bic(k)]=aicbic(logL,numParams,n);
    end
end
fprintf('R,M,AIC,BIC的对应值如下\n %f');  %显示计算结果
check=[R',M',aic',bic']
r=input('输入阶数R＝');m=input('输入阶数M＝');
ToEstMd=arima('ARLags',1:r,'MALags',1:m,'Constant',0); %指定模型的结构
[EstMd,EstParamCov,logL,info]=estimate(ToEstMd,da); %模型拟合
dx_Forecast=forecast(EstMd,10,'Y0',da)  %计算10步预报值
x_Forecast=a(end)+cumsum(dx_Forecast)   %计算原始数据的10步预测值
