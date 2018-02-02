clc, clear,alpha=0.1;
edges=[-inf 20:10:100 inf]; %原始数据区间的边界
x=[25:10:95]; %原始数据区间的中心 
num=[5 15 30 51 60 23 10 6];
pd=@(x)normcdf(x,60,15); %定义正态分布的分布函数
[h,p,st]=chi2gof(x,'cdf',pd,'Edges',edges,'Frequency',num)
pi=st.E/sum(st.O) %计算表中的第3列数据
col4=st.E %显示表中的第4列数据
col5=st.O.^2./col4  %计算表中的第5列数据
sumcol5=sum(col5)  %计算表中第5列数据的和
k2=chi2inv(1-alpha,st.df) %求临界值

