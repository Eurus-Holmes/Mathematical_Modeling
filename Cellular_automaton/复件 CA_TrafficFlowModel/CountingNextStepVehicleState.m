function [CellSpace_nextstep VehicleSpace] = CountingNextStepVehicleState(CellSpace_current,CellSpace_nextstep,VehicleSpace,TakenMat, TakenCarIDMat,VMAX,signalFlag,UseLaneChangingModelFlag)
%计算下一时刻的元胞空间状态

%获取当前时刻元胞空间中的车辆信息，
[VehicleInCellSpaceMat]=GetVehicleInCellSpace(CellSpace_current,TakenMat,TakenCarIDMat);

if isempty(VehicleInCellSpaceMat) == 1 %如果为空
    return;
end;
%对每个车辆进行遍历，%获取每个车辆的数据，以及邻居车辆的数据
%计算每个车辆的下一时刻状态并更新到下一时刻的元胞空间中

[CellSpace_nextstep VehicleSpace] = UpdataCellSpaceWithVehicleInfo(CellSpace_current,CellSpace_nextstep,VehicleSpace,VehicleInCellSpaceMat,VMAX,signalFlag,UseLaneChangingModelFlag);

end