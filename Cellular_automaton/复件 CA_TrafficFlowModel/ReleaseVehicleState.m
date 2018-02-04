function VehicleSpace = ReleaseVehicleState(VehicleSpace,carid)

VehicleSpace{carid}{3} = 0;%车辆当前速度
VehicleSpace{carid}{4} = 0;%车辆下一时刻速度
VehicleSpace{carid}{5} = 2;%是否进入元胞区域，0没有，1进入，2驶离

end