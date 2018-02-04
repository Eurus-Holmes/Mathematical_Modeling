function CANaSchModel()
Vmax=10;                                                         %最大速度
n=5000;                                                         %元胞个数
Timestep=2000;                                                   %演化时间步数
P=0.8;                                                          %车辆密度
slowp=0.01;                                                     %慢化几率
X=rand(1,n)>P;
carpos=find(X>0);                                               %车辆位置信息
carnum=length(carpos);
Position=zeros(Timestep+1,n);                             %车辆位置数据表
cardis=zeros(1,carnum-1);                                         %车辆之间的距离信息
carvel=fix(rand(1,carnum)*Vmax);                       %车辆初始速度
Position(1,:)=X;
for i=1:carnum-1                                                %计算车辆初始距离并存储
    cardis(i)=carpos(i+1)-carpos(i)-1;
end
i=i+1;
cardis(i)=n+carpos(1)-carpos(i)-1;
for j=2:Timestep+1
    for i=1:carnum                                               %更改车辆速度
        if carvel(i)<cardis(i)
            carvel(i)=min(carvel(i)+1,Vmax);
        else carvel(i)=min(carvel(i),cardis(i));
        end
        if rand(1)<slowp                                         %随机慢化
            carvel(i)=max(carvel(i)-1,0);
        end
        tempos=carpos(i)+carvel(i);                          %change the position
        if tempos<=n
            carpos(i)=tempos;
        else carpos(i)=tempos-n;
        end
        Position(j,carpos(i))=1;
    end
    for i=1:carnum-1                                             %caculate the distance depend on cars' position
        if carpos(i)<carpos(i+1)
            cardis(i)=carpos(i+1)-carpos(i)-1;
        else cardis(i)=n+carpos(i+1)-carpos(i)-1
        end
    end
    i=i+1;                                                       % set the last car's distance 
    if carpos(i)<carpos(1)
        cardis(i)=carpos(1)-carpos(i)-1;
    else
        cardis(i)=n+carpos(1)-carpos(i)-1;
    end
end
%vector=ones(1,n);
%for i=1:Timestep+1
%Position(i,1:n)=xor(Position(i,1:n),vector(1:n));
%end
imshow(Position);
axis on;

        
    

