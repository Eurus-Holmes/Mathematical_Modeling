clc, clear
edges=[0:100:300 inf]; bins=[50 150 250 inf]; %定义原始数据区域的边界和中心
num=[121 78 43 58]; %已知观测频数
pd=makedist('exp',200)  %定义指数分布
[h,p,st]=chi2gof(bins,'Edges',edges,'cdf',pd,'Frequency',num) 
pi=st.E/sum(st.O) %计算表中的第3列数据
col4=st.E %显示表中的第4列数据
col5=st.O.^2./col4  %计算表中的第5列数据
sumcol5=sum(col5)  %计算表中第5列数据的和
k2=chi2inv(0.95,st.df)  %求临界值，st.df为自由度
