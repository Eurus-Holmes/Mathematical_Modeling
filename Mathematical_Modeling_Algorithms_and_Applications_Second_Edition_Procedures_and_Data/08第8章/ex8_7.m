clc, clear
elps=randn(10000,1); x(1:2)=0;
for i=3:10000
    x(i)=-0.6*x(i-1)-0.2*x(i-2)+elps(i); %产生模拟数据
end
xlswrite('data1.xls',x(end-9:end)) %把x的后10个数据保存到Excel文件中
dlmwrite('mydata.txt',x)  %供下面例8.13的GARCH模型使用同样的数据
x=x'; m=ar(x,2)   %进行参数估计
xhat=forecast(m,x,3) %计算3个预测值
