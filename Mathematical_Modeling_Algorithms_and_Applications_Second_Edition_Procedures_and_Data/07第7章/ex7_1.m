clc, clear
x0=[506  508  499  503  504  510  497  512
514  505  493  496  506  502  509  496]; x0=x0(:);
alpha=0.05;
mu=mean(x0), sig=std(x0), n=length(x0);
t=[mu-sig/sqrt(n)*tinv(1-alpha/2,n-1),mu+sig/sqrt(n)*tinv(1-alpha/2,n-1)]
%以下命令ttest的返回值ci就直接给出了置信区间估计
[h,p,ci]=ttest(x0,mu,0.05)  %通过假设检验也可求得置信区间
