% .     http://blog.csdn.net/pangel18/article/details/52349840
% .     模拟退火算法
% 下面MATLAB程序用于求解非线性规划：
% min f(x)=x1^2+x2^2+8
% st.
% x1^2-x2>=0
% -x1-x2^2+2=0
% x1,x2>=0



clear  
clc  
  
%生成初始解  
sol_new2=1;%（1）解空间（初始解）  
sol_new1=2-sol_new2^2;  
sol_current1 = sol_new1;   
sol_best1 = sol_new1;  
sol_current2 = sol_new2;   
sol_best2 = sol_new2;  
E_current = inf;  
E_best = inf;  
  
rand('state',sum(clock)); %初始化随机数发生器  
t=90; %初始温度  
tf=89.9; %结束温度  
a = 0.99; %温度下降比例  
  
while t>=tf%（7）结束条件  
    for r=1:1000 %退火次数  
          
        %产生随机扰动（3）新解的产生  
        sol_new2=sol_new2+rand*0.2;  
        sol_new1=2-sol_new2^2;  
          
        %检查是否满足约束  
        if sol_new1^2-sol_new2>=0 && -sol_new1-sol_new2^2+2==0 && sol_new1>=0 &&sol_new2>=0  
        else  
            sol_new2=rand*2;  
            sol_new1=2-sol_new2^2;  
            continue;  
        end  
          
        %退火过程  
        E_new=sol_new1^2+sol_new2^2+8;%（2）目标函数  
        if E_new<E_current%（5）接受准则  
                E_current=E_new;  
                sol_current1=sol_new1;  
                sol_current2=sol_new2;  
                if E_new<E_best  
                    %把冷却过程中最好的解保存下来  
                    E_best=E_new;  
                    sol_best1=sol_new1;  
                    sol_best2=sol_new2;  
                end  
        else  
                if rand<exp(-(E_new-E_current)/t)%（4）代价函数差  
                    E_current=E_new;  
                    sol_current1=sol_new1;  
                    sol_current2=sol_new2;  
                else  
                    sol_new1=sol_current1;  
                    sol_new2=sol_current2;  
                end  
        end  
        plot(r,E_best,'*')  
        hold on  
    end  
    t=t*a;%（6）降温  
end  
  
disp('最优解为：')  
disp(sol_best1)  
disp(sol_best2)  
disp('目标表达式的最小值等于：')  
disp(E_best)  