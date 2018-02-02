clc, clear, n=100;
f=0:7; num=[36  40  19  2   0   2   1   0]; 
lamda=dot(f,num)/100
pi=poisspdf(f,lamda) 
[h,p,st]=chi2gof(f,'ctrs',f,'frequency',num,'expected',n*pi,'nparams',1) %调用工具箱
col3=st.E/sum(st.O) %计算表中的第3列数据
col4=st.E %显示表中的第4列数据
col5=st.O.^2./col4  %计算表中的第5列数据
sumcol5=sum(col5)  %计算表中第5列数据的和
k2=chi2inv(0.95,st.df)  %求临界值，st.df为自由度
