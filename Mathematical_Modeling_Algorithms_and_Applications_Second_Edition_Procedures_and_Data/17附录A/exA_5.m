clc, clear
x=-3:0.1:3;y=-5:0.1:5;
[x,y]=meshgrid(x,y); %生成网格数据
z=(sin(x.*y)+eps)./(x.*y+eps); %为避免0/0,分子分母都加eps
mesh(x,y,z)

