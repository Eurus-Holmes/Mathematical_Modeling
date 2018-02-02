clc, fid=fopen('shuju.txt','r'); i=1;
while (~feof(fid))
data=fgetl(fid);
a=sum(data==97);
b=sum(data==99);
c=sum(data==103);
d=sum(data==116);
e=sum(data>=97&data<=122);
f(i,:)=[a  b  c  d  e  a+b+c+d];
i=i+1;
end
f, he=sum(f)
dlmwrite('pinshu.txt',f); dlmwrite('pinshu.txt',he,'-append');
fclose(fid);
