clc,clear
syms m V rho g k s(t) v(t) %定义符号常数和符号变量
ds=diff(s); %定义s的一阶导数，为了初值条件赋值
s=dsolve(m*diff(s,2)-m*g+rho*g*V+k*diff(s),s(0)==0,ds(0)==0);
s=subs(s,{m,V,rho,g,k},{239.46,0.2058,1035.71,9.8,0.6}); %常数赋值
s=simplify(s); %化简
s=vpa(s,6)  %显示小数形式的位移函数
v=dsolve(m*diff(v)-m*g+rho*g*V+k*v,v(0)==0);
v=subs(v,{m,V,rho,g,k},{239.46,0.2058,1035.71,9.8,0.6});
v=simplify(v); %化简
v=vpa(v,6)  %显示小数形式的速度函数
y=s-90; 
tt=solve(y); tt=double(tt)   %求到达海底90米处的时间
vv=subs(v,tt);vv=double(vv)  %求到底海底90米处的速度
