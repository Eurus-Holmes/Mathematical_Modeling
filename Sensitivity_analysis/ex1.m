% .     https://baike.baidu.com/item/√Ù∏––‘∑÷Œˆ/500733?fr=aladdin
% .     http://blog.csdn.net/qq_37917868/article/details/65648000

clear all 
clc
hold off
%sample of size N
N=100;

%sample generation
x1=rand(N,1)-0.5;
x2=rand(N,1)-0.5;
x3=rand(N,1)-0.5;

plot(x1,x2,'o')
hold on
plot(x1,x3,'o')


%model evaluations
y=4*x1.^2+3*x2+x3;


%set n. of stripes
r=10;


for i=1:r
t=(i-1)/r-0.5;
ind=find(x1<t+1/r & x1>t);
condmean1(i)=mean(y(ind));
ind=find(x2<t+1/r & x2>t);
condmean2(i)=mean(y(ind));
ind=find(x3<t+1/r & x3>t);
condmean3(i)=mean(y(ind));
end


S1=var(condmean1)
S2=var(condmean2)
S3=var(condmean3)
plot(x1,y,'o')
hold on; grid
plot([-.5+1/(2*r):1/r:.5-1/(2*r)],condmean1,'ro')


figure
plot(x2,y,'o')
hold on; grid
plot([-.5+1/(2*r):1/r:.5-1/(2*r)],condmean2,'yo')
figure
plot(x3,y,'o')
hold on; grid
plot([-.5+1/(2*r):1/r:.5-1/(2*r)],condmean3,'go')
hold off