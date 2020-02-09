library(dplyr)
library(lubridate)
data<-read.table(".\\exdata_data_household_power_consumption\\household_power_consumption.txt",sep=";",stringsAsFactor=FALSE,header=TRUE,dec=".")
dim(data)
class(data$Date)
data$date_time<-paste(data$Date,data$Time,sep = " ")

data$date_time<-dmy_hms(data$date_time)

class(data$date_time)

data$Date<-dmy(data$Date)



subset_data<-data[data$Date>="2007/02/01"&data$Date<="2007/02/02",]

subset_data$Sub_metering_1<-as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2<-as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3<-as.numeric(subset_data$Sub_metering_3)


png("plot3.png",width=480,height = 480)
plot(subset_data$date_time,subset_data$Sub_metering_1, type="l",col="black",ylab="Energy Sub Meeting", xlab="")
lines(subset_data$date_time,subset_data$Sub_metering_2,type="l",col="red")
lines(subset_data$date_time,subset_data$Sub_metering_3,type="l",col="blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1,lwd=2.5)
dev.off()
