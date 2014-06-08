getwd()
setwd("C://Users//Owner//DataJazz//ExData_Plotting1//figure")
data<-read.table("household_power_consumption.txt",strip.white=TRUE,stringsAsFactors=FALSE,skip=1,sep=";",col.names=c("Date","Time","GlobalActivePower",
                                                    "GlobalReactivePower","Voltage","GlobalIntensity","Submetering1","Submetering2","Submetering3"))


test<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

Date <- as.Date(test$Date, format = "%d/%m/%Y") 
test$DateTime <- paste(Date, test$Time)

x <- strptime(test$DateTime, format="%Y-%m-%d %H:%M:%S")

GlobalActivePower<-as.numeric(test$GlobalActivePower)
GlobalActivePower<-GlobalActivePower[!is.na(GlobalActivePower)]

png("plot2.png",width = 480, height = 480, units = "px")
plot(x ,GlobalActivePower,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()



