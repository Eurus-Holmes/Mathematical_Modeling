rand('state',sum(clock));  %初始化随机数发生器
p0=0;
tic    %计时开始
for i=1:10^6
   x=randi([0,99],1,5); %产生一行五列的区间[0,99]上的随机整数
   [f,g]=mengte(x);
   if all(g<=0)
       if p0<f
           x0=x; p0=f; %记录下当前较好的解
       end
   end
end
x0,p0
toc    %计时结束
