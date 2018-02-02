clc, clear
alpha=0.05; ta=tinv(1-alpha,4)
x0=[1050  1100  1120  1250  1280];
xb=mean(x0), s=std(x0), n=length(x0);
mu=xb-s/sqrt(n)*ta %计算单侧置信下限
[h,p,ci]=ttest(x0,xb,'Alpha',0.05,'Tail','right')  %通过假设检验也可求得置信区间
