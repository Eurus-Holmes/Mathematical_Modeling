function [CellSpace VehicleSpace]= RefreshCellSpaceWithNewPosition(CellSpace,carid,carlength,oldi,oldj,newi,newj,VehicleSpace,speednext)
%用新位置更新老位置
[m n] = size(CellSpace);

if newj > n % 已经走到了尽头
    CellSpace = ReleaseCellTakenState(CellSpace,oldi,oldj,carlength);%将元胞清空
    VehicleSpace = ReleaseVehicleState(VehicleSpace,carid);
else
    CellSpace = ReleaseCellTakenState(CellSpace,oldi,oldj,carlength);%将元胞清空
    VehicleSpace = ReleaseVehicleState(VehicleSpace,carid);
    CellSpace = DeployCellTakenState(CellSpace,newi,newj,carid,carlength);%重新分配
    VehicleSpace = DeployVehicleState(VehicleSpace,carid,speednext);
end;

end