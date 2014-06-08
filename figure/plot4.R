getwd()
setwd("C://Users//Owner//DataJazz//ExData_Plotting1//figure")
data<-read.table("household_power_consumption.txt",strip.white=TRUE,stringsAsFactors=FALSE,skip=1,sep=";",col.names=c("Date","Time","GlobalActivePower",
                                                                                                                      "GlobalReactivePower","Voltage","GlobalIntensity","Submetering1","Submetering2","Submetering3"))
col.names=c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","Submetering1","Submetering2","Submetering3")
)

test<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

Date <- as.Date(test$Date, format = "%d/%m/%Y") 
test$DateTime <- paste(Date, test$Time)
x <- strptime(test$DateTime, format="%Y-%m-%d %H:%M:%S")

png("plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(x ,GlobalActivePower,type="l",xlab="",ylab="Global Active Power")
plot(x ,test$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(x ,test$Submetering1,type="l",xlab="",ylab = "Energy Sub Metering")
lines(x,test$Submetering2,type="l", col="red")
lines(x,test$Submetering3,type="l", col="blue")
legend("topright",c("Submetering1","Submetering2","Submetering3"),
       lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))
plot(x ,test$GlobalReactivePower,type="l",xlab="datetime",ylab="Global Reactive Power")
dev.off()