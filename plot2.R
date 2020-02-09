
library(lubridate)
data<-read.table(".\\exdata_data_household_power_consumption\\household_power_consumption.txt",sep=";",stringsAsFactor=FALSE,header=TRUE,dec=".")
dim(data)
class(data$Date)
data$date_time<-paste(data$Date,data$Time,sep = " ")

data$date_time<-dmy_hms(data$date_time)

class(data$date_time)

data$Date<-dmy(data$Date)



subset_data<-data[data$Date>="2007/02/01"&data$Date<="2007/02/02",]

subset_data$Global_active_power<-as.numeric(subset_data$Global_active_power)

png("plot2.png",width=480,height = 480)
plot(subset_data$date_time,subset_data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
