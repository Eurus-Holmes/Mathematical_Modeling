getwd()
setwd("/Users/chenfeiyang/2018MCM_C")
getwd()

#导入数据
dyn.load('/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home/lib/server/libjvm.dylib')
library("rJava")
library("xlsxjars")
library("xlsx")
seseds<-read.xlsx(file = "/Users/chenfeiyang/2018MCM_C/ProblemCData.xlsx",sheetIndex = 1,header=TRUE)
View(seseds)
msncodes<-read.xlsx(file = "/Users/chenfeiyang/2018MCM_C/ProblemCData.xlsx",sheetName = "msncodes",header=TRUE)
View(msncodes)

#数据预处理
class(ProblemCData)
sum(is.na(ProblemCData))
library(outliers)
set.seed(1);s1=.Random.seed   #设置随机数种子，保证每次出现的随机数相同
y=rnorm(100)     #生成100个标准正太随机数
outlier(y)
plot(y)
points(-2.2147,pch=8)  #用星号标记离群值

CA<-ProblemCData[ProblemCData$StateCode=="CA",]
View(CA)

AZ<-ProblemCData[ProblemCData$StateCode=="AZ",]
View(AZ)

NM<-ProblemCData[ProblemCData$StateCode=="NM",]
View(NM)

TX<-ProblemCData[ProblemCData$StateCode=="TX",]
View(TX)

#Part I:A
#数据可视化
library(ggplot2)  
p1<-ggplot(data=CA, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="CA_Data~Year", x="Year", y="energy production and consumption")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
p2<-ggplot(data=AZ, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="AZ_Data~Year", x="Year", y="energy production and consumption")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
p3<-ggplot(data=NM, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="NM_Data~Year", x="Year", y="energy production and consumption")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
p4<-ggplot(data=TX, aes(x=Year, y=Data)) +
  geom_smooth() +
  labs(title="TX_Data~Year", x="Year", y="energy production and consumption")+
  theme(plot.title = element_text(hjust = 0.5))  #也就加上这一行
library(gridExtra)
grid.arrange(p1,p2,p3,p4, nrow=2)

#Part I:
#B
sum_CA<-aggregate(CA[4],CA[1],sum)
View(sum_CA)

sum_AZ<-aggregate(AZ[4],AZ[1],sum)
View(sum_AZ)

sum_NM<-aggregate(NM[4],NM[1],sum)
View(sum_NM)

sum_TX<-aggregate(TX[4],TX[1],sum)
View(sum_TX)

x_CA=transform(sum_CA, pct=round(sum_CA$Data/sum(sum_CA$Data)*100)) #数据框增加百分比列 
y_CA=x_CA[order(x_CA[,2],decreasing=T),]#排序
z_CA=y_CA[1:10,]
p_CA <- ggplot(data=z_CA, aes(x=MSN, y=Data,fill=z_CA$Data), fill=z_CA$Data) +
  geom_bar(stat="identity")

x_AZ=transform(sum_AZ, pct=round(sum_AZ$Data/sum(sum_AZ$Data)*100)) #数据框增加百分比列 
y_AZ=x_AZ[order(x_AZ[,2],decreasing=T),]#排序
z_AZ=y_AZ[1:10,]
p_AZ <- ggplot(data=z_AZ, aes(x=MSN, y=Data,fill=z_AZ$Data), fill=z_AZ$Data) +
  geom_bar(stat="identity")

x_NM=transform(sum_NM, pct=round(sum_NM$Data/sum(sum_NM$Data)*100)) #数据框增加百分比列 
y_NM=x_NM[order(x_NM[,2],decreasing=T),]#排序
z_NM=y_NM[1:10,]
p_NM <- ggplot(data=z_NM, aes(x=MSN, y=Data,fill=z_NM$Data), fill=z_NM$Data) +
  geom_bar(stat="identity")

x_TX=transform(sum_TX, pct=round(sum_TX$Data/sum(sum_TX$Data)*100)) #数据框增加百分比列 
y_TX=x_TX[order(x_TX[,2],decreasing=T),]#排序
z_TX=y_TX[1:10,]
p_TX <- ggplot(data=z_TX, aes(x=MSN, y=Data,fill=z_TX$Data), fill=z_TX$Data) +
  geom_bar(stat="identity")

grid.arrange(p_CA,p_AZ,p_NM,p_TX, nrow=2)