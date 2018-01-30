% .   http://blog.sina.com.cn/s/blog_631a4cc40101df0f.html
% .   学习支持向量机SVM及其代码
%主函数
clear all;
close all;
C = 10;
kertype = 'linear';
%训练样本
n = 50;
randn('state',6);
x1 = randn(2,n);    %2行N列矩阵
y1 = ones(1,n);       %1*N个1
x2 = 5+randn(2,n);   %2*N矩阵
y2 = -ones(1,n);      %1*N个-1
 
figure;
plot(x1(1,:),x1(2,:),'bx',x2(1,:),x2(2,:),'k.'); 
axis([-3 8 -3 8]);
hold on;
 
X = [x1,x2];        %训练样本d*n矩阵，n为样本个数，d为特征向量个数
Y = [y1,y2];        %训练目标1*n矩阵，n为样本个数，值为+1或-1
svm = svmTrain(X,Y,kertype,C);
plot(svm.Xsv(1,:),svm.Xsv(2,:),'ro');

%测试
[x1,x2] = meshgrid(-2:0.05:7,-2:0.05:7);  %x1和x2都是181*181的矩阵
[rows,cols] = size(x1);  
nt = rows*cols;                  
Xt = [reshape(x1,1,nt);reshape(x2,1,nt)];
Yt = ones(1,nt);
result = svmTest(svm, Xt, Yt, kertype);

Yd = reshape(result.Y,rows,cols);
contour(x1,x2,Yd,'m');
