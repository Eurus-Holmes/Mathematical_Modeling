function CA184rule()
n=1000;
X=rand(1,n)>0.9;
X(n+1)=X(1);
Timestep=500;
data=zeros(Timestep,n);
Y=zeros(1,n);
for j=1:Timestep
    for i=1:n
        if i~=1
            if X(i-1)==1&&X(i)==0
                Y(i)=1;
           % elseif X(i)==1&&X(i+1)==0
              %  Y(i)=0;
            elseif X(i)==1&&X(i+1)==1
                Y(i)=1;
            else Y(i)=0;
            end
        else
            if X(n)==1&&X(i)==0
                Y(i)=1;
            %elseif X(i)==1&&X(i+1)==0
               % Y(i)=0;
            elseif X(i)==1&&X(i+1)==1
                Y(i)=1;
            else Y(i)=0;
            end
        end
    end
   X=Y;   
   X(n+1)=Y(1);
   data(j,:)=Y;
end
imshow(data);
axis on;

 

        
            