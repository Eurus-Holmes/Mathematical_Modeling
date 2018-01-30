% .    P88 .    例5.1 机床加工   要求用分段线性和三次样条两种插值方法计算
x0=[0   3   5   7   9   11   12   13   14  15];
y0=[0  1.2  1.7  2.0  2.1  2.0  1.8  1.2   1.0  1.6];
x=0:0.1:15;
y1=interp1(x0,y0,x);
y2=interp1(x0,y0,x,'spline');
pp1=csape(x0,y0);
y3=ppval(pp1,x);
pp2=csape(x0,y0,'second');
y4=ppval(pp2,x);
[x',y1',y2',y3',y4']
subplot(1,3,1)   
%subplot是将多个图画到一个平面上的工具。
% 使用方法：subplot（m,n,p）或者subplot（m n p）。
% 其中，m表示是图排成m行，n表示图排成n列，
% 也就是整个figure中有n个图是排成一行的，一共m行，如果m=2就是表示2行图。
% p表示图所在的位置，p=1表示从左到右从上到下的第一个位置。
plot(x0,y0,'+',x,y1)
title('Piecewise linear')
subplot(1,3,2)
plot(x0,y0,'+',x,y2)
title('Spline1')
subplot(1,3,3)
plot(x0,y0,'+',x,y3)
title('Spline2')
dx=diff(x);
dy=diff(y3);
dy_dx=dy./dx;
dy_dx0=dy_dx(1)
ytemp=y3(131:151);
ymin=min(ytemp);
index=find(y3==ymin);
xmin=x(index);
[xmin,ymin]
