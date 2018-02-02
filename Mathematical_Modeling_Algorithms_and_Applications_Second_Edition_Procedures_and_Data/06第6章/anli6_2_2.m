clc,clear
syms m V rho g k v(t)
v=dsolve(m*diff(v)-m*g+rho*g*V+k*v^2,v(0)==0);
v=subs(v,{m,V,rho,g,k},{239.46,0.2058,1035.71,9.8,0.6});
v=simplify(v); v=vpa(v,6)  %显示小数形式的速度函数
T=solve(v-12.2); T=double(T)  %求时间的临界值T
s=int(v,0,T)      %求位移的临界值
