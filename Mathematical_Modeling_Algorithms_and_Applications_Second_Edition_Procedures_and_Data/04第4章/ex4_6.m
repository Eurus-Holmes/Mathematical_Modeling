clc;clear;
a(1,[2,3])=[50,60]; a(2,[4,5])=[65,40]; %这里给出邻接矩阵的另外一种输入方式
a(3,[4,7])=[52,45]; a(4,[5,6])=[50,30];
a(4,7)=42; a(5,6)=70; 
[i,j,b]=find(a);
data=[i';j';b'];index=data(1:2,:);
loop=length(a)-1;
result=[];
while length(result)<loop
   temp=min(data(3,:));
   flag=find(data(3,:)==temp);
   flag=flag(1);
   v1=index(1,flag);v2=index(2,flag);
   if v1~=v2
      result=[result,data(:,flag)];
   end
   index(find(index==v2))=v1;
   data(:,flag)=[];
   index(:,flag)=[];
end
result
