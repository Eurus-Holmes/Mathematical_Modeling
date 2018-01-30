% .   P97 .   例5.10 .  lsqnonlin
clc, clear
load data2  %分别加载xi的观测值x0，yi的观测值y0
F=@(cs) 1/sqrt(2*pi)/cs(2)*exp(-(x0-cs(1)).^2/cs(2)^2/2)-y0; %F(x)取作误差向量
cs0=rand(2,1); %拟合参数的初始值是任意取的
cs=lsqnonlin(F,cs0)
