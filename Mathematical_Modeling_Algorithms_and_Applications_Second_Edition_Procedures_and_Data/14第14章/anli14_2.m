clc, clear
a=load('zhaopin.txt');   %把原始数据保存在纯文本文件zhaopin.txt中，并且把A，B，C，D分别替换成相应的数值
b=zscore(a); %数据标准化
E=[1 4 2 8 2; 1/4 1 1/2 2 1/2; 1/2 2 1 4 1; 1/8 1/2 1/4 1 1/4; 1/2 2 1 4 1];
[vec, val]=eigs(E,1) %求模最大的特征值及对应的特征向量
w=vec/sum(vec)  %求归一化特征向量，即权重
w=repmat(w',16,1); %扩充为与数据矩阵相同的维数
c=b.*w    %计算加权属性
cstar=max(c)    %求正理想解
c0=min(c)       %求负理想解
for i=1:16
    sstar(i)=norm(c(i,:)-cstar);   %求到正理想解的距离
    s0(i)=norm(c(i,:)-c0);       %求到负理想的距离
end
f=s0./(sstar+s0);
xlswrite('book3.xls',[sstar' s0' f'])  %把计算结果写到Excel文件中，便于将来做表
[sc,ind]=sort(f,'descend')       %求排序结果
