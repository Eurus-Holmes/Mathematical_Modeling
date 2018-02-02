clc, clear
fi=dir('*.xls') %提出Excel文件的信息，返回值是结构数据
n=length(fi); %计算Excel文件的个数
myData=cell(1,n);
for k=1:n
    myData{k}=importdata(fi(k).name);
end
celldisp(myData) %显示细胞数组的数据
