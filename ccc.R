dyn.load('/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home/lib/server/libjvm.dylib')
library("rJava")
library("xlsxjars")
library("xlsx")
seseds<-read.xlsx(file = "ProblemCData.xlsx",sheetIndex = 1,header=TRUE)
View(seseds)


consumption<-read.xlsx(file = "total end-use consumption.xlsx",sheetIndex = 1,header=TRUE)
View(consumption)

seseds2<-merge(seseds,consumption,all.y = TRUE)
View(seseds2)
write.xlsx(seseds2,file = "seseds2.xlsx")

consumption_AZ<-seseds2[seseds2$StateCode=="AZ",]
View(consumption_AZ)
write.xlsx(consumption_AZ,file = "consumption_AZ.xlsx")
consumption_AZ_sum<-aggregate(consumption_AZ[4],consumption_AZ[1],sum)
consumption_AZ_sum$Data<-consumption_AZ_sum$Data/1000
View(consumption_AZ_sum)
write.xlsx(consumption_AZ_sum,file = "consumption_AZ_sum.xlsx")

consumption_TX<-seseds2[seseds2$StateCode=="TX",]
View(consumption_TX)
consumption_TX_sum<-aggregate(consumption_TX[4],consumption_TX[1],sum)
consumption_TX_sum$Data<-consumption_TX_sum$Data/1000
View(consumption_TX_sum)
write.xlsx(consumption_TX_sum,file = "consumption_TX_sum.xlsx")

consumption_NM<-seseds2[seseds2$StateCode=="NM",]
View(consumption_NM)
consumption_NM_sum<-aggregate(consumption_NM[4],consumption_NM[1],sum)
consumption_NM_sum$Data<-consumption_NM_sum$Data/1000
View(consumption_NM_sum)
write.xlsx(consumption_NM_sum,file = "consumption_NM_sum.xlsx")

consumption_CA<-seseds2[seseds2$StateCode=="CA",]
View(consumption_CA)
consumption_CA_sum<-aggregate(consumption_CA[4],consumption_CA[1],sum)
consumption_CA_sum$Data<-consumption_CA_sum$Data/1000
View(consumption_CA_sum)
write.xlsx(consumption_CA_sum,file = "consumption_CA_sum.xlsx")

production<-read.xlsx(file = "production.xlsx",sheetIndex = 1,header=TRUE)
View(production)

seseds3<-merge(seseds,production,all.y = TRUE)
View(seseds3)
write.xlsx(seseds3,file = "seseds3.xlsx")

production_AZ<-seseds3[seseds3$StateCode=="AZ",]
View(production_AZ)
production_AZ_sum<-aggregate(production_AZ[4],production_AZ[1],sum)
production_AZ_sum$Data<-production_AZ_sum$Data/1000
View(production_AZ_sum)
write.xlsx(production_AZ_sum,file = "production_AZ_sum.xlsx")

production_TX<-seseds3[seseds3$StateCode=="TX",]
View(production_TX)
production_TX_sum<-aggregate(production_TX[4],production_TX[1],sum)
production_TX_sum$Data<-production_TX_sum$Data/1000
View(production_TX_sum)
write.xlsx(production_TX_sum,file = "production_TX_sum.xlsx")

production_NM<-seseds3[seseds3$StateCode=="NM",]
View(production_NM)
production_NM_sum<-aggregate(production_NM[4],production_NM[1],sum)
production_NM_sum$Data<-production_NM_sum$Data/1000
View(production_NM_sum)
write.xlsx(production_NM_sum,file = "production_NM_sum.xlsx")

production_CA<-seseds3[seseds3$StateCode=="CA",]
View(production_CA)
production_CA_sum<-aggregate(production_CA[4],production_CA[1],sum)
production_CA_sum$Data<-production_CA_sum$Data/1000
View(production_CA_sum)
write.xlsx(production_CA_sum,file = "production_CA_sum.xlsx")


electricity<-read.xlsx(file = "Net Electricity Generation by source.xlsx",sheetIndex = 1,header=TRUE)
View(electricity)

seseds4<-merge(seseds,electricity,all.y = TRUE)
View(seseds4)
write.xlsx(seseds4,file = "seseds4.xlsx")

electricity_AZ<-seseds4[seseds4$StateCode=="AZ",]
View(electricity_AZ)
electricity_AZ_sum<-aggregate(electricity_AZ[4],electricity_AZ[1],sum)
electricity_AZ_sum$Data<-electricity_AZ_sum$Data/1000
View(electricity_AZ_sum)
write.xlsx(electricity_AZ_sum,file = "electricity_AZ_sum.xlsx")

electricity_TX<-seseds4[seseds4$StateCode=="TX",]
View(electricity_TX)
electricity_TX_sum<-aggregate(electricity_TX[4],electricity_TX[1],sum)
electricity_TX_sum$Data<-electricity_TX_sum$Data/1000
View(electricity_TX_sum)
write.xlsx(electricity_TX_sum,file = "electricity_TX_sum.xlsx")

electricity_NM<-seseds4[seseds4$StateCode=="NM",]
View(electricity_NM)
electricity_NM_sum<-aggregate(electricity_NM[4],electricity_NM[1],sum)
electricity_NM_sum$Data<-electricity_NM_sum$Data/1000
View(electricity_NM_sum)
write.xlsx(electricity_NM_sum,file = "electricity_NM_sum.xlsx")

electricity_CA<-seseds4[seseds4$StateCode=="CA",]
View(electricity_CA)
electricity_CA_sum<-aggregate(electricity_CA[4],electricity_CA[1],sum)
electricity_CA_sum$Data<-electricity_CA_sum$Data/1000
View(electricity_CA_sum)
write.xlsx(electricity_CA_sum,file = "electricity_CA_sum.xlsx")



library(ggplot2)  
p1_consumption_AZ<-ggplot(data=consumption_AZ, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="Arizona energy consumption", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
loess(Data~Year,data = consumption_AZ)

p2_consumption_TX<-ggplot(data=consumption_TX, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="Texas energy consumption", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
loess(Data~Year,data = consumption_TX)

p3_consumption_NM<-ggplot(data=consumption_NM, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="New Mexico energy consumption", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
loess(Data~Year,data = consumption_NM)

p4_consumption_CA<-ggplot(data=consumption_CA, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="California energy consumption", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
loess(Data~Year,data = consumption_CA)

library(gridExtra)
grid.arrange(p1_consumption_AZ,p2_consumption_TX,p3_consumption_NM,p4_consumption_CA, nrow=2)


p1_production_AZ<-ggplot(data=production_AZ, aes(x=Year, y=Data/1000)) +
  geom_smooth() +
  labs(title="Arizona energy production", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))
loess(Data~Year,data = production_AZ)

p2_production_TX<-ggplot(data=production_TX, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="Texas energy production", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))
loess(Data~Year,data = production_TX)

p3_production_NM<-ggplot(data=production_NM, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="New Mexico energy production", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))
loess(Data~Year,data = production_NM)

p4_production_CA<-ggplot(data=production_CA, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="California energy production", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))
loess(Data~Year,data = production_CA)

grid.arrange(p1_production_AZ,p2_production_TX,p3_production_NM,p4_production_CA, nrow=2)


p1_electricity_AZ<-ggplot(data=electricity_AZ, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="Arizona electricity generation", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
loess(Data~Year,data = electricity_AZ)

p2_electricity_TX<-ggplot(data=electricity_TX, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="Texas electricity generation", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
loess(Data~Year,data = electricity_TX)

p3_electricity_NM<-ggplot(data=electricity_NM, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="New Mexico electricity generation", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
loess(Data~Year,data = electricity_NM)

p4_electricity_CA<-ggplot(data=electricity_CA, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="California electricity generation", x="year", y="Trillion Btu")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
loess(Data~Year,data = electricity_CA)

grid.arrange(p1_electricity_AZ,p2_electricity_TX,p3_electricity_NM,p4_electricity_CA, nrow=2)





Total_consumption<-read.xlsx(file = "Total end-use energy consumption.xlsx",sheetIndex = 1,header=TRUE)
View(Total_consumption)
seseds_consumption<-merge(seseds,Total_consumption,all.y = TRUE)
View(seseds_consumption)
View(seseds2)
y<-merge(seseds2,seseds_consumption,all = TRUE)
View(y)
z<-y[y$MSN=="TETXB",]
View(z)
d<-rep(z$Data,each=11)
View(d)

z<-seseds2[order(seseds2$StateCode,seseds2$Year),]
View(z)
z$total<-d
View(z)
z$Data<-(z$Data/z$total)*z$Data
View(z)


consumption_AZ2<-z[z$StateCode=="AZ",]
View(consumption_AZ2)
#write.xlsx(consumption_AZ2,file = "consumption_AZ2.xlsx")
consumption_AZ2_sum<-aggregate(consumption_AZ2[4],consumption_AZ2[3],sum)
View(consumption_AZ2_sum)
write.xlsx(consumption_AZ2_sum,file = "consumption_AZ2_sum.xlsx")
ggplot(data=consumption_AZ2_sum, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="", x="year", y="")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
loess(consumption_AZ2_sum$Data~consumption_AZ2_sum$Year)
predict(loess(consumption_AZ2_sum$Data~consumption_AZ2_sum$Year))

consumption_CA2<-z[z$StateCode=="CA",]
View(consumption_CA2)
consumption_CA2_sum<-aggregate(consumption_CA2[4],consumption_CA2[3],sum)
View(consumption_CA2_sum)
write.xlsx(consumption_CA2_sum,file = "consumption_CA2_sum.xlsx")

consumption_NM2<-z[z$StateCode=="NM",]
View(consumption_NM2)
consumption_NM2_sum<-aggregate(consumption_NM2[4],consumption_NM2[3],sum)
View(consumption_NM2_sum)
write.xlsx(consumption_NM2_sum,file = "consumption_NM2_sum.xlsx")


consumption_TX2<-z[z$StateCode=="TX",]
View(consumption_TX2)
consumption_TX2_sum<-aggregate(consumption_TX2[4],consumption_TX2[3],sum)
View(consumption_TX2_sum)
write.xlsx(consumption_TX2_sum,file = "consumption_TX2_sum.xlsx")




Total_production<-read.xlsx(file = "Total energy production.xlsx",sheetIndex = 1,header=TRUE)
View(Total_production)
seseds_production<-merge(seseds,Total_production,all.y = TRUE)
View(seseds_production)
View(seseds3)
y<-merge(seseds3,seseds_production,all = TRUE)
View(y)
z<-y[y$MSN=="TEPRB",]
View(z)
d<-rep(z$Data,each=6)
View(d)

z<-seseds3[order(seseds3$StateCode,seseds3$Year),]
View(z)
z$total<-d
View(z)
z$Data<-(z$Data/z$total)*z$Data
View(z)

production_AZ2<-z[z$StateCode=="AZ",]
View(production_AZ2)
production_AZ2_sum<-aggregate(production_AZ2[4],production_AZ2[3],sum)
View(production_AZ2_sum)
write.xlsx(production_AZ2_sum,file = "production_AZ2_sum.xlsx")
ggplot(data=production_AZ2_sum, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="", x="year", y="")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
loess(production_AZ2_sum$Data~production_AZ2_sum$Year)
predict(loess(production_AZ2_sum$Data~production_AZ2_sum$Year))

production_CA2<-z[z$StateCode=="CA",]
View(production_CA2)
production_CA2_sum<-aggregate(production_CA2[4],production_CA2[3],sum)
View(production_CA2_sum)
write.xlsx(production_CA2_sum,file = "production_CA2_sum.xlsx")

production_NM2<-z[z$StateCode=="NM",]
View(production_NM2)
production_NM2_sum<-aggregate(production_NM2[4],production_NM2[3],sum)
View(production_NM2_sum)
write.xlsx(production_NM2_sum,file = "production_NM2_sum.xlsx")


production_TX2<-z[z$StateCode=="TX",]
View(production_TX2)
production_TX2_sum<-aggregate(production_TX2[4],production_TX2[3],sum)
View(production_TX2_sum)
write.xlsx(production_TX2_sum,file = "production_TX2_sum.xlsx")




states_2009<-read.xlsx(file = "2009.xlsx",sheetIndex = 1,header=TRUE)
View(states_2009)
criteria<-read.xlsx(file = "criteria.xlsx",sheetIndex = 1,header=TRUE)
View(criteria)
x<-merge(states_2009,criteria,all.y = TRUE)
View(x)

criteria_AZ<-x[x$StateCode=="AZ",]
View(criteria_AZ)
write.xlsx(criteria_AZ,file = "criteria_AZ.xlsx")

criteria_CA<-x[x$StateCode=="CA",]
View(criteria_CA)
write.xlsx(criteria_CA,file = "criteria_CA.xlsx")

criteria_NM<-x[x$StateCode=="NM",]
View(criteria_NM)
write.xlsx(criteria_NM,file = "criteria_NM.xlsx")

criteria_TX<-x[x$StateCode=="TX",]
View(criteria_TX)
write.xlsx(criteria_TX,file = "criteria_TX.xlsx")








