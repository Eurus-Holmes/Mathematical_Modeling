clc, clear
tf=dir('*.txt') %提出纯文本文件的信息，返回值是结构数据
n=length(tf); %计算纯文本文件的个数
fts=ascii2fts(tf(1).name);  %读第一个文件中的时间序列数据
fts=extfield(fts,{'series2','series3'}); %提出第2个字段和第3个字段
for i=2:n
    tp1=ascii2fts(tf(i).name); %读时间序列数据
    tp2=extfield(tp1,{'series2','series3'}); %提出第2,3字段
    str1=['series',num2str(2*i)]; str2=['series',num2str(2*i+1)];
    tp3=fints(tp2.dates,fts2mat(tp2),{str1,str2}); %把时间序列改名
    fts=merge(fts,tp3); %合并两个时间序列的数据
end
fts %显示合并提出的两个字段数据
