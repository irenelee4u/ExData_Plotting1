##download file
URL <- "./household_power_consumption.txt"
## File read
data <-read.table(URL, skip =1, sep=";")
## naming each cols
names(data) <- c("Date", "Time", "Global_active_power", "Voltage", "Global_Intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")

## read data between specific dates
subdata <- subset(data, data$Date == "1/2/2007" | data$Date=="2/2/2007")

png("Plot1.png",width=480, height=480)

##
hist(subdata[,Global_active_power],main="Global Active Power" ,col="red", main ="Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab="Frequency")
dev.off()


