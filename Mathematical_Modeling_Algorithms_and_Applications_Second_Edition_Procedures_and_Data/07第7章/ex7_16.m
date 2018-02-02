clc, clear
a=[142.84  97.04  32.46  69.14  85.67  114.43  41.76  163.07  108.22  63.28];
eta=sqrt(mean(a.^2))  %求最大似然估计
beta=2; B=5000; alpha=0.05;
b=wblrnd(eta,beta,[B,10]);  %产生服从韦布尔分布的随机数
etahat=sqrt(mean(b.^2,2));  %计算每个样本对应的最大似然估计
seta=sort(etahat);  %把B个最大似然估计按照从小到大排列
k=floor(B*alpha)
se=seta(k)  %提取相应位置的估计量
Rt0=exp(-(50/se)^2)  %求对应的置信下限
