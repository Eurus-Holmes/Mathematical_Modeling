function ResultsPlotting()
%% 读取配置信息
SavingSettingsMat = load('OutputDataSettings.ini');
%输出数据子文件夹
subfoldername = SavingSettingsMat(1);
%%
lanenodatafile = [num2str(subfoldername) '\车辆占用车道数据.txt'];
positiondatafile = [num2str(subfoldername) '\车辆所处位置.txt'];
speeddatafile = [num2str(subfoldername) '\车辆每一时刻速度.txt'];
cartypeinfofile = [num2str(subfoldername) '\车辆基本信息.txt'];

%%
LaneTakenDMat = importdata(lanenodatafile);
VehPositionDMat = importdata(positiondatafile);
SpeedDMat = importdata(speeddatafile);
VehicleInfoMat = load(cartypeinfofile);

%% 
[stepNum, carNum] = size(SpeedDMat);
[Volume SimTime TimeStep LaneNum CellNum VMAX] = GetBasicInfo();


%% 
travelTime = zeros(1,carNum);%每辆车的旅行时间

for i = 1:carNum
    travelTime(1,i) = length(find(SpeedDMat(:,i)>=0));
end;
%%
meanSpeed = zeros(stepNum,1);%平均速度
meanQueue = zeros(stepNum,1);%平均排队长度
volDensity = zeros(stepNum,1);%密度

for j = 1:stepNum
    existedCarIDs = find(SpeedDMat(j,:)>=0);
    volDensity(j,1) = sum(GetVehicleLength(existedCarIDs)) / (LaneNum * CellNum);
    meanQueue(j,1) = sum(GetVehicleLength(find(SpeedDMat(j,:)<=1)))/LaneNum;
    meanSpeed(j,1) = mean(SpeedDMat(j,SpeedDMat(j,:)>=0));
end;



%%
%%
%%
%%
end