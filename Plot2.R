##download file
URL <- "./household_power_consumption.txt"
## File read
data <-read.table(URL, skip =1, sep=";")
## naming each cols
names(data) <- c("Date", "Time", "Global_active_power", "Voltage", "Global_Intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")

## read data between specific dates
subdata <- subset(data, data$Date == "1/2/2007" | data$Date=="2/2/2007")

##useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440, "Time"] <- format(subdata[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subdata[1441:2880, "Time"] <- format(subdata[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

##strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%y %H:%M:%S")
globalActivePower <- as.numeric(as.character(subdata$Global_active_power))
## create a png file
png("Plot2.png",width=480, height=480)

##plotting a graph
plot(subdata$Time, globalActivePower, type ="l", xlab="", ylab="Global Active Power (kilowatts)" )
##adding a main title
title(main= "Global Active Power Vs Time")
##off the device
dev.off()


