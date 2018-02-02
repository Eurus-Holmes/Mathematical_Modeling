clc, clear
c=[3 8 2 10 3;8 7 2 9 7;6 4 2 7 5
   8 4 2 3 5;9 10 6 9 10];
c=c(:); a=zeros(10,25); intcon=1:25;
for i=1:5
   a(i,(i-1)*5+1:5*i)=1;
   a(5+i,i:5:25)=1;
end
b=ones(10,1); lb=zeros(25,1); ub=ones(25,1);
x=intlinprog(c,intcon,[],[],a,b,lb,ub);
x=reshape(x,[5,5])
