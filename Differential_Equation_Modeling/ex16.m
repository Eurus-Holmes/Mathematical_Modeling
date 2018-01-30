% .  P123 .  例6.11 . 注意在函数中的所有变量都是局部变量，为了便于随时调用一些变量的取值，可以使用匿名函数
clc, clear
yprime=@(x,y)[y(2);(y(1)-1)*(1+y(2)^2)^(3/2)]; %定义一阶方程组的匿名函数
res=@(ya,yb)[ya(1);yb(1)]; %定义边值条件的匿名函数
yinit=@(x)[x.^2;2*x]; %定义初始猜测解的匿名函数，这里换了另外一个初始猜测解
solinit=bvpinit(linspace(-1,1,20),yinit); %给出初始猜测解的结构
sol=bvp4c(yprime,res,solinit); %计算数值解
fill(sol.x,sol.y(1,:),[0.7,0.7,0.7]) %填充解曲线
axis([-1,1,0,1])
xlabel('x','FontSize',12)
ylabel('h','Rotation',0,'FontSize',12)
