function addprobability = IfAddNewCar()

ratio = load('NewVehicleEntryRatio.ini');

addprobability = isSatisfy(0.5,0.15,ratio(1));

end