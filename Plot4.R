##download file
URL <- "./household_power_consumption.txt"
## File read
data <-read.table(URL, skip =1, sep=";")
## naming each cols
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power" ,"Voltage", "Global_Intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")

## read data between specific dates
subdata <- subset(data, data$Date == "1/2/2007" | data$Date=="2/2/2007")

##rearrange time and date with specific dates
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440, "Time"] <- format(subdata[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subdata[1441:2880, "Time"] <- format(subdata[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

## create a png file with partitioning with many graphs
png("Plot4.png", width=480, height=480)
par(mfrow=c(2,2))
##plotting 2 by 2 graphs
 plot(subdata$Time, as.numeric(as.character(subdata$Global_active_power)), type="l", xlab="", ylab="Global Active Power")
 plot(subdata$Time, as.numeric(as.character(subdata$Voltage)), type="l", xlab="datatime", ylab="Voltage")
 plot(subdata$Time, as.numeric(as.character(subdata$Sub_metering_1)), type="l", xlab="", ylab="Energy Submetering")
  lines(subdata$Time, as.numeric(as.character(subdata$Sub_metering_2)), col="red")
  lines(subdata$Time, as.numeric(as.character(subdata$Sub_metering_3)), col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col= c("black", "red", "blue"))
plot(subdata$Time, as.numeric(as.character(subdata$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")
##off the device
dev.off()
