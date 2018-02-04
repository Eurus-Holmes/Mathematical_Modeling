function [ CellSpace_nextstep VehicleSpace ] = TrafficSimulating( SimTime,TimeStep,CellSpace_current, CellSpace_nextstep, VehicleSpace,VMAX )
%TRAFFICSIMULATING Summary of this function goes here
%   仿真程序主体
CellSpace_Init = CellSpace_nextstep;
%   读取信号配时数据
SignalCycleMat = load('SignalCycleInfo.ini');
sCycle = SignalCycleMat(1);%周期长度
sGreenTime = SignalCycleMat(2);%绿灯时长
sRedTime = SignalCycleMat(3);%红灯时长
%% 是否加载换道模型
LaneChangingModelINIMat = load('LaneChangingModeInfo.ini');
UseLaneChangingModelFlag = LaneChangingModelINIMat(1);

%%
%时间步长和时长必须满足整除关系
for iStep = 1:TimeStep:SimTime
    %判断信号配时
    tCurrentMod = mod(iStep,sCycle);
    if tCurrentMod <= sGreenTime
        signalFlag = 0;
    else
        signalFlag = 1;
    end;
    %搜寻元胞上存在的车辆，获得每个元胞的车辆占用情况，以及占用车辆的编号
    [TakenMat TakenCarHeadMat TakenCarIDMat] = SearchCellSpaceForTaken(CellSpace_current);
    %计算每个车辆的更新信息
    [CellSpace_nextstep VehicleSpace] = CountingNextStepVehicleState(CellSpace_current,CellSpace_nextstep,VehicleSpace,TakenMat, TakenCarIDMat,VMAX,signalFlag,UseLaneChangingModelFlag);
    %判断是否发新车，并计算新车的更新信息
    %更新元胞空间
    [CellSpace_nextstep VehicleSpace] = AddingNewCarsToEntry(CellSpace_current,CellSpace_nextstep,VehicleSpace);
    %
    %统计相关信息
    %保持数据
    SavingDataAsFiles(CellSpace_current,VehicleSpace,TakenMat,TakenCarHeadMat,TakenCarIDMat);
    %绘制图像
    DrawingCellSpace(TakenMat);
    
    %进入下一轮循环
    CellSpace_current = CellSpace_nextstep;
    CellSpace_nextstep = CellSpace_Init;
end;



end

