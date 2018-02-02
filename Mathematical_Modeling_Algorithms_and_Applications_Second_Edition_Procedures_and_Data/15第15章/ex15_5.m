clc,clear
x0=[4.93   2.33   3.87   4.35   6.63   7.15   5.37   6.39   7.81   8.35];
x1=cumsum(x0);  %求1次累加序列
n=length(x0);
z=0.5*(x1(2:n)+x1(1:n-1));   %求x1的均值生成序列
B=[-z',z'.^2];
Y=x0(2:end)';
u=B\Y     %估计参数a,b的值
syms x(t)
x=dsolve(diff(x)+u(1)*x==u(2)*x^2,x(0)==x0(1));  %求符号解
xt=vpa(x,6) %显示小数形式的符号解
yuce=subs(x,'t',[0:n-1]); %求已知数据点1次累加序列的预测值
yuce=double(yuce) %符号数转换成数值类型，否则无法作差分运算
x0_hat=[yuce(1),diff(yuce)] %求已知数据点的预测值
epsilon=x0-x0_hat    %求残差
delta=abs(epsilon./x0)  %求相对误差
xlswrite('book4.xls',[x0',x0_hat',epsilon',delta'])
