% .  P118 . 放射性废料的处理 问题一
clc,clear
syms m V rho g k
s=dsolve('m*D2s-m*g+rho*g*V+k*Ds','s(0)=0,Ds(0)=0');
s=subs(s,{m,V,rho,g,k},{239.46,0.2058,1035.71,9.8,0.6});
s=simplify(s);
s=vpa(s,6)  %显示小数形式的位移函数
v=dsolve('m*Dv-m*g+rho*g*V+k*v','v(0)=0');
v=subs(v,{m,V,rho,g,k},{239.46,0.2058,1035.71,9.8,0.6});
v=simplify(v);
v=vpa(v,6)  %显示小数形式的速度函数
y=s-90; 
tt=solve(y);tt=double(tt)   %求到达海底90米处的时间
vv=subs(v,tt);vv=double(vv)  %求到底海底90米处的速度
