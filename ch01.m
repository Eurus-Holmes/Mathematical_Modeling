%  画出衰减振荡曲线y及其它的包络线y0    t的取值范围是[0,4π]
t=0:pi/50:4*pi;
y0=exp(-t/3);
y=exp(-t/3).*sin(3*t);
plot(t,y,'-r',t,y0,':b',t,-y0,':b')
grid


%画出z所表示的三维曲面   x,y的取值范围是[?8,8] 
clear;
x=-8:0.5:8;
y=x';
X=ones(size(y))*x;
Y=y*ones(size(x));
R=sqrt(X.^2+Y.^2)+eps; %<5>
Z=sin(R)./R; %<6>
surf(X,Y,Z); 
colormap(cool) 
xlabel('x'),ylabel('y'),zlabel('z')

%在指令窗中运用 who, whos 查阅 MATLAB 内存变量
who
whos
clear y
whos


%绘制函数 y = xe ? x 在 0 ≤ x ≤ 1 时的曲线
x=0:0.1:1
y=x.*exp(-x);
plot(x,y),xlabel('x'),ylabel('y'),title('y=x*exp(-x)')


%子数组的寻访(Address)
rand('state',0)
x=rand(1,5)
x(3)
x([1 2 5])
x(1:3)
x(3:end) 
x(3:-1:1) 
x(find(x>0.5))
x([1 2 3 4 4 3 2 1])


%子数组的赋值(Assign)
x(3)=0
x([1 4])=[1 1]