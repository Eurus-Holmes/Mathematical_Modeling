clc, clear
n=5  %文件个数
mydata=cell(1, n); %初始化存放各个文件数据的细胞数组
for k=1:n
    filename=sprintf('book%d.xls', k); %构造文件名的格式化字符串
    mydata{k}=importdata(filename); %从文件导入数据
end
celldisp(mydata) %显示细胞数组的数据