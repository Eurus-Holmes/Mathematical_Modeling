% .   P46 .  从起点sb到终点db通用的Floyd算法程序
function [dist,mypath]=myfloyd(a,sb,db);
% 输入：a?邻接矩阵，元素(aij)是顶点i到j之间的直达距离，可以是有向的
% sb?起点的标号；db?终点的标号
% 输出：dist?最短路的距离；% mypath?最短路的路径

%example:
a=zeros(6); %邻接矩阵初始化
a(1,2)=50;a(1,4)=40;a(1,5)=25;a(1,6)=10;
a(2,3)=15;a(2,4)=20;a(2,6)=25;
a(3,4)=10;a(3,5)=20;
a(4,5)=10;a(4,6)=25;
a(5,6)=55;
a=a+a';
sb=1;
db=4;
%

n=size(a,1); path=zeros(n);
for k=1:n
    for i=1:n
        for j=1:n
            if a(i,j)>a(i,k)+a(k,j)
                a(i,j)=a(i,k)+a(k,j);
                path(i,j)=k;
            end
        end
    end
end
dist=a(sb,db);
parent=path(sb,:); %从起点sb到终点db的最短路上各顶点的前驱顶点
parent(parent==0)=sb; %path中的分量为0，表示该顶点的前驱是起点
mypath=db; t=db;
while t~=sb
        p=parent(t); mypath=[p,mypath];
        t=p;
end
dist
mypath
