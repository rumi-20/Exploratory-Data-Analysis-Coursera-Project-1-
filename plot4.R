
library(lubridate)
data<-read.table(".\\exdata_data_household_power_consumption\\household_power_consumption.txt",sep=";",stringsAsFactor=FALSE,header=TRUE,dec=".")
dim(data)
class(data$Date)
data$date_time<-paste(data$Date,data$Time,sep = " ")

data$date_time<-dmy_hms(data$date_time)

class(data$date_time)

data$Date<-dmy(data$Date)



subset_data<-data[data$Date>="2007/02/01"&data$Date<="2007/02/02",]

png("plot4.png",width=480,height = 480)

par(mfrow=c(2,2))

#Plot1
subset_data$Global_active_power<-as.numeric(subset_data$Global_active_power)

plot(subset_data$date_time,subset_data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")


#Plot2
subset_data$Voltage<-as.numeric(subset_data$Voltage)
plot(subset_data$date_time,subset_data$Voltage, type="l",ylab="Voltage", xlab="datetime")


#Plot3

subset_data$Sub_metering_1<-as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2<-as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3<-as.numeric(subset_data$Sub_metering_3)

plot(subset_data$date_time,subset_data$Sub_metering_1, type="l",col="black",ylab="Energy Sub Meeting", xlab="")
lines(subset_data$date_time,subset_data$Sub_metering_2,type="l",col="red")
lines(subset_data$date_time,subset_data$Sub_metering_3,type="l",col="blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="o",lty = 1,lwd=2.5)

#Plot#4

subset_data$Global_reactive_power<-as.numeric(subset_data$Global_reactive_power)

plot(subset_data$date_time,subset_data$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")


dev.off()

