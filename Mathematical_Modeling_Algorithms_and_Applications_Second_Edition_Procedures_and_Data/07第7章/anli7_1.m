clc, clear
x0=[2.5320,2.6470,2.6290,2.5840,2.6090,2.6010,2.5280,2.5630,2.6540,2.6190];
n=length(x0);
me=quantile(x0,0.5)  %计算中位数
[h,p,stat]=runstest(x0,me)  %进行游程检验
x1=cumsum(x0);  %求累加序列
zk=(x1(1:end-1)+x1(2:end))/2  %求累加序列的均值序列
B=[-zk', ones(size(zk'))]; yn=x0(2:end)';
ab=B\yn  %拟合参数a,b
syms x(t)
x=dsolve(diff(x)+ab(1)*x==ab(2),x(0)==x0(1)); %求微分方程的符号解
xx=vpa(x,6)  %显示小数格式的符号解
yuce=subs(x,'t',[0:n+5]);  %求累加序列的预测值
yuce=double(yuce); %把符号数转换成数值类型
yuce0=[x0(1),diff(yuce)]  %求原始数据的预测值
c=std(yuce0(1:n))/std(x0)  %求后验差比值c
nyuce=yuce0(n+1:end)  %提取6个新的预测值
nyb=[x0, nyuce];  %构造新的样本数据
nnyb=reshape(nyb,[4,4])
mu=mean(nnyb)  %分别求4个子样本的均值
jc=range(nnyb)  %分别求4个子样本的极差
xlswrite('hb.xls',[nnyb;mu;jc])  %把数据写到Excel文件中，便于做表使用
b=rand(4,1000); %产生4行1000列的随机数矩阵
h=floor(b*length(nyb))+1; %把随机数映射为编号(每列对应bootstrap样本编号)
bb=repmat(nyb',1,1000); bb=bb(h); %对新序列进行重复抽样
mmu=mean(bb); mjc=range(bb); %计算1000个子样本的均值和极差
smu=sort(mmu); sjc=sort(mjc); %把均值和极差按照从小到大的次序排列
alpha=0.0027; k1=floor(1000*alpha/2), k2=floor(1000*(1-alpha/2))
mqj=[smu(k1), smu(k2)]  %显示均值的置信区间
jqj=[sjc(k1), sjc(k2)]  %显示极差的置信区间
subplot(1,2,1), plot(mu,'*-'), hold on, plot([1,4],[mqj(1),mqj(1)])
plot([1,4],[mqj(2),mqj(2)]), ylabel('样本均值')
subplot(1,2,2), plot(jc,'*-'), hold on, plot([1,4],[jqj(1),jqj(1)]), 
plot([1,4],[jqj(2),jqj(2)]), ylabel('极差')
