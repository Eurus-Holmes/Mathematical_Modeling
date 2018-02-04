function out=MMSmteam(s,m,mu1,mu2,T)
%M/M/S/m排队模型
%s——修理工个数
%m——机器源数
%T——时间终止点
%mu1——机器离开-到达时间服从指数分布
%mu2——修理时间服从指数分布
%事件表：
%  p_s——修理工空闲概率
%   arrive_time——机器到达事件
%   leave_time——机器离开事件
%mintime——事件表中的最近事件
%current_time——当前时间
%L——队长
%tt——时间序列
%LL——队长序列
%c——机器到达时间序列
%b——修理开始时间序列
%e——机器离开时间序列
%a_count——到达机器数
%b_count——修理机器数
%e_count——损失机器数

%初始化

arrive_time=exprnd(mu1,1,m);
arrive_time=sort(arrive_time);
leave_time=[];
current_time=0;
L=0;
LL=[L];
tt=[current_time];
c=[];
b=[];
e=[];
a_count=0;
%循环
while min([arrive_time,leave_time])<T
    current_time=min([arrive_time,leave_time]);
    tt=[tt,current_time];    %记录时间序列
    if current_time==min(arrive_time)      %机器到达子过程
        arrive_time(1)=[];  % 从事件表中抹去机器到达事件
        a_count=a_count+1; %累加到达机器数
        if  L<s            %有空闲修理工
            L=L+1;        %更新队长
            c=[c,current_time];%记录机器到达时间序列
            b=[b,current_time];%记录修理开始时间序列
            leave_time=[leave_time,current_time+exprnd(mu2)];%产生新的机器离开事件
            leave_time=sort(leave_time);%离开事件表排序
        else             %无空闲修理工
            L=L+1;        %更新队长
            c=[c,current_time];%记录机器到达时间序列
        end
    else                   %机器离开子过程
            leave_time(1)=[];%从事件表中抹去机器离开事件
            arrive_time=[arrive_time,current_time+exprnd(mu1)];
            arrive_time=sort(arrive_time);%到达事件表排序
            e=[e,current_time];%记录机器离开时间序列
            if L>s   %有机器等待
                L=L-1;        %更新队长
                b=[b,current_time];%记录修理开始时间序列
                leave_time=[leave_time,current_time+exprnd(mu2)];%产生新的机器离开事件
                leave_time=sort(leave_time);%离开事件表排序
            else    %无机器等待
                L=L-1;        %更新队长
            end
    end
    LL=[LL,L];   %记录队长序列
end
Ws=sum(e-c(1:length(e)))/length(e);
Wq=sum(b-c(1:length(b)))/length(b);
Wb=sum(e-b(1:length(e)))/length(e);
Ls=sum(diff([tt,T]).*LL)/T;
Lq=sum(diff([tt,T]).*max(LL-s,0))/T;
p_s=1.0/(factorial(m)/factorial(m).*(mu2/mu1)^0+factorial(m)/factorial(m-1).*(mu2/mu1)^1+factorial(m-2)/factorial(m-1).*(mu2/mu1)^2+factorial(m)/factorial(m-2).*(mu2/mu1)^2+factorial(m)/factorial(m-4).*(mu2/mu1)^4+factorial(m)/factorial(m-5).*(mu2/mu1)^5);
fprintf('修理工空闲概率:%d\n',p_s)%修理工空闲概率
fprintf('到达机器数:%d\n',a_count)%到达机器数
fprintf('平均逗留时间:%f\n',sum(e-c(1:length(e)))/length(e))%平均逗留时间
fprintf('平均等待时间:%f\n',sum(b-c(1:length(b)))/length(b))%平均等待时间
fprintf('平均修理时间:%f\n',sum(e-b(1:length(e)))/length(e))%平均修理时间
fprintf('平均队长:%f\n',sum(diff([tt,T]).*LL)/T)%平均队长
fprintf('平均等待队长:%f\n',sum(diff([tt,T]).*max(LL-s,0))/T)%平均等待队长
for i=0:m
     p(i+1)=sum((LL==i).*diff([tt,T]))/T;%队长为i的概率
     fprintf('队长为%d的概率:%f\n',i,p(i+1));
end
fprintf('机器不能马上得到修理的概率:%f\n',1-sum(p(1:s)))%机器不能马上得到修理的概率
out=[Ws,Wq,Wb,Ls,Lq,p];