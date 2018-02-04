function CellSpace = ReleaseCellTakenState(CellSpace,i,j,carlength)
%清除原来的状态
if j-carlength+1 <=0
    for tag = j:-1:1
        CellSpace{i,tag}{3} = 0;
        CellSpace{i,tag}{4} = 0;
        CellSpace{i,tag}{5} = -1;
    end;    
else
    for tag = j:-1:j-carlength+1
        CellSpace{i,tag}{3} = 0;
        CellSpace{i,tag}{4} = 0;
        CellSpace{i,tag}{5} = -1;
    end;
end;
end