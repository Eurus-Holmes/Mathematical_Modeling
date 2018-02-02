clc,clear
x=load('water.txt');  %把原始数据按照表中的格式存放在纯文本文件water.txt
x=x'; x=x(:);  %按照时间的先后次序，把数据变成列向量
s=12;  %周期s=12
n=12;  %预报数据的个数
m1=length(x);   %原始数据的个数
for i=s+1:m1
    y(i-s)=x(i)-x(i-s); %进行周期差分变换
end
w=diff(y);   %消除趋势性的差分运算
m2=length(w); %计算最终差分后数据的个数
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
        [EstMd,EstParamCov,logL,info]=estimate(ToEstMd,w'); %模型拟合
        numParams = sum(any(EstParamCov)); %计算拟合参数的个数
        %compute Akaike and Bayesian Information Criteria
        [aic(k),bic(k)]=aicbic(logL,numParams,m2);
    end
end
fprintf('R,M,AIC,BIC的对应值如下\n %f');  %显示计算结果
check=[R',M',aic',bic']
r=input('输入阶数R＝');m=input('输入阶数M＝');
ToEstMd=arima('ARLags',1:r,'MALags',1:m,'Constant',0); %指定模型的结构
[EstMd,EstParamCov,logL,info]=estimate(ToEstMd,w'); %模型拟合
w_Forecast=forecast(EstMd,n,'Y0',w')  %计算12步预报值,注意已知数据是列向量
yhat=y(end)+cumsum(w_Forecast)     %求一阶差分的还原值
for j=1:n
    x(m1+j)=yhat(j)+x(m1+j-s); %求x的预测值
end
xhat=x(m1+1:end)   %截取n个预报值
