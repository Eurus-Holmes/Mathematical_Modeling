clc, clear
n=5;  %文件个数
range='A2:G10';
sheet=1;
myData=cell(1,n);
for k=1:n
    fileName=sprintf('book%02d.xls',k);
    myData{k}=xlsread(fileName,sheet,range);
end
celldisp(myData) %显示细胞数组的数据
