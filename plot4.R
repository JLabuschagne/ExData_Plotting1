"script for Plot 4"
"load data"
mydata <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
"load dplyr package"
library(dplyr)
"store Date as date"
mydata <- mutate(mydata,DateTime = as.POSIXct(as.character(paste(mydata$Date, mydata$Time)), format="%d/%m/%Y %H:%M:%S"))
mydata <- mutate(mydata,Date = as.Date(Date,"%d/%m/%Y"))
"select subset of data"
subdata <- filter(mydata,Date == "2007-02-01"|Date == "2007-02-02")
subdata <- mutate(subdata, Global_active_power = as.numeric(Global_active_power))
"set colums and rows of plots"
par(mfrow = c(2,2))
"create plot4 - 1"
plot(subdata$DateTime,subdata$Global_active_power, type = "l", xlab = "",ylab = "Global Active Power")
"create plot4 - 2"
plot(subdata$DateTime,subdata$Voltage, type ="l", xlab = "datetime", ylab = "Voltage",lwd = 0.75)
"create plot4 - 3"
plot(subdata$DateTime,subdata$Sub_metering_1, type = "l",ylab = "Energy sub metering",xlab ="")
points(subdata$DateTime,subdata$Sub_metering_2,type = "l", col = "red")
points(subdata$DateTime,subdata$Sub_metering_3,type = "l", col = "blue")
legend("topright",inset=.05, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty = "n")
"create plot4 - 4"
plot(subdata$DateTime,subdata$Global_reactive_power, type = "l", xlab = "datetime",ylab = "Global_reactive_power", lwd = 0.75)
"copy"
dev.copy(png, file = "plot4.png", height = 480, width = 480)
"disconnect"
dev.off()
