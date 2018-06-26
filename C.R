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
msncodes<-read.xlsx(file = "/Users/chenfeiyang/2018MCM_C/1.xlsx",sheetIndex = 1,header=TRUE)
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

#Part I:A
#数据可视化

#Consumption by Source
x<-merge(seseds,msncodes,all.y = TRUE)
View(x)

y_CA<-x[x$StateCode=="CA",]
View(y_CA)
#factor(y_CA$MSN)
mean_CA<-aggregate(y_CA[4],y_CA[1],mean)
View(mean_CA)

y_AZ<-x[x$StateCode=="AZ",]
View(y_AZ)
#factor(y_AZ$MSN)
mean_AZ<-aggregate(y_AZ[4],y_AZ[1],mean)
View(mean_AZ)

y_NM<-x[x$StateCode=="NM",]
View(y_NM)
#factor(y_CA$MSN)
mean_NM<-aggregate(y_NM[4],y_NM[1],mean)
View(mean_NM)

y_TX<-x[x$StateCode=="TX",]
View(y_TX)
#factor(y_CA$MSN)
mean_TX<-aggregate(y_TX[4],y_TX[1],mean)
View(mean_TX)

library(ggplot2)
library(gridExtra)

x_CA=transform(mean_CA, pct=round(mean_CA$Data/sum(mean_CA$Data)*100)) #数据框增加百分比列 
y_CA=x_CA[order(x_CA[,2],decreasing=T),]#排序
p_CA <- ggplot(data=y_CA, aes(x=MSN, y=Data/1000,fill=y_CA$Data/1000), fill=y_CA$Data/1000) +
  geom_bar(stat="identity")
#添加横纵坐标名称，添加图的名称
p_CA<-p_CA + xlab("") + ylab("Trillion Btu") + ggtitle("California Energy Consumption")+
  guides(fill=guide_legend(title="")) +
  theme(plot.title = element_text(hjust = 0.5)) 

x_AZ=transform(mean_AZ, pct=round(mean_AZ$Data/sum(mean_AZ$Data)*100)) #数据框增加百分比列 
y_AZ=x_AZ[order(mean_AZ[,2],decreasing=T),]#排序
p_AZ <- ggplot(data=y_AZ, aes(x=MSN, y=Data/1000,fill=y_AZ$Data/1000), fill=y_AZ$Data/1000) +
  geom_bar(stat="identity")
#添加横纵坐标名称，添加图的名称
p_AZ<-p_AZ + xlab("") + ylab("Trillion Btu") + ggtitle("Arizona Energy Consumption")+
  guides(fill=guide_legend(title="")) +
  theme(plot.title = element_text(hjust = 0.5))  

x_NM=transform(mean_NM, pct=round(mean_NM$Data/sum(mean_NM$Data)*100)) #数据框增加百分比列 
y_NM=x_NM[order(mean_NM[,2],decreasing=T),]#排序
p_NM <- ggplot(data=y_NM, aes(x=MSN, y=Data/1000,fill=y_NM$Data/1000), fill=y_NM$Data/1000) +
  geom_bar(stat="identity")
#添加横纵坐标名称，添加图的名称
p_NM<-p_NM + xlab("") + ylab("Trillion Btu") + ggtitle("New Mexico Energy Consumption")+
  guides(fill=guide_legend(title="")) +
  theme(plot.title = element_text(hjust = 0.5))  

x_TX=transform(mean_TX, pct=round(mean_TX$Data/sum(mean_TX$Data)*100)) #数据框增加百分比列 
y_TX=x_TX[order(x_TX[,2],decreasing=T),]#排序
p_TX <- ggplot(data=y_TX, aes(x=MSN, y=Data/1000,fill=y_TX$Data/1000), fill=y_TX$Data/1000) +
  geom_bar(stat="identity")
#添加横纵坐标名称，添加图的名称
p_TX<-p_TX + xlab("") + ylab("Trillion Btu") + ggtitle("Texas Energy Consumption")+
  guides(fill=guide_legend(title="")) +
  theme(plot.title = element_text(hjust = 0.5)) 

grid.arrange(p_CA,p_AZ,p_NM,p_TX, nrow=2)



#Consumption by Sector
az<-read.xlsx(file = "/Users/chenfeiyang/2018MCM_C/AZ.xlsx",sheetIndex = 1,header=TRUE)
View(az)
sum_AZ<-aggregate(az[4],az[1],mean)
View(sum_AZ)
write.xlsx(sum_AZ,file = "sum_AZ.xlsx")

sum_AZ2<-read.xlsx(file = "/Users/chenfeiyang/2018MCM_C/sum_AZ2.xlsx",sheetIndex = 1,header=TRUE)
sum_AZ2 = sum_AZ2[order(sum_AZ2$Data, decreasing = TRUE),]
myLabel = as.vector(sum_AZ2$MSN)   
myLabel = paste(myLabel, "(", round(sum_AZ2$Data / sum(sum_AZ2$Data) * 100, 2), "%)", sep = "")   
p = ggplot(sum_AZ2, aes(x = "", y = Data, fill = MSN)) +
  geom_bar(stat = "identity", width = 1) +    
  coord_polar(theta = "y") + 
  labs(x = "", y = "", title = "Arizona Energy Consumption by End-Use Sector") + 
  theme(axis.ticks = element_blank()) + 
  theme(axis.text.x = element_blank()) + 
  guides(fill=guide_legend(title="")) +
  scale_fill_discrete(breaks = sum_AZ2$MSN, labels = myLabel)
p







