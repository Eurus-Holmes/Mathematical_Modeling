% .   P246 .  例10.12 . 最大似然估计法求因子载荷矩阵
clc,clear
r=[1 1/5 -1/5;1/5 1 -2/5;-1/5 -2/5 1];
[Lambda,Psi] = factoran(r,1,'xtype','cov') %Lambda返回的是因子载荷矩阵，Psi返回的是特殊方差
