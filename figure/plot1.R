getwd()
setwd("C://Users//Owner//DataJazz//ExData_Plotting1//figure")
data<-read.table("household_power_consumption.txt",strip.white=TRUE,stringsAsFactors=FALSE,skip=1,sep=";",col.names=c("Date","Time","GlobalActivePower",
                                                                                                                      "GlobalReactivePower","Voltage","GlobalIntensity","Submetering1","Submetering2","Submetering3"))
col.names=c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","Submetering1","Submetering2","Submetering3")

test<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

GlobalActivePower<-as.numeric(test$GlobalActivePower)


png("plot1.png",width = 480, height = 480, units = "px")
mygraph<-hist(GlobalActivePower,xlab = "Global Active Power (kilowatts)",
     col="red",main = "Global Active Power",breaks=12)
dev.off()

#png(filename="C:/R/figure.png", height=295, width=300, 
#bg="white")