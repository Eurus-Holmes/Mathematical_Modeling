clc, clear, alpha=0.1;
a=textread('ex7_5.txt'); a=nonzeros(a); %读入数据，去掉多余的零并展开成列向量
xbar=mean(a), s=std(a) %求均值和标准差
mm=minmax(a')  %求观察值的最大值和最小值
pd=@(x)normcdf(x,xbar,s); %定义正态分布
[h,p,st]=chi2gof(a,'cdf',pd,'NParams',2)  %调用工具箱的假设检验命令
pi=st.E/length(a) %计算概率
col4=st.E %显示表中的第4列数据
tj=st.O.^2./st.E, stj=sum(tj) %计算表中的最后一列及和
k2=chi2inv(1-alpha,st.df) %求临界值
