"script for Plot 3"
"load data"
mydata <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
"load dplyr package"
library(dplyr)
"store Date as date"
mydata <- mutate(mydata,DateTime = as.POSIXct(as.character(paste(mydata$Date, mydata$Time)), format="%d/%m/%Y %H:%M:%S"))
mydata <- mutate(mydata,Date = as.Date(Date,"%d/%m/%Y"))
"select subset of data"
subdata <- filter(mydata,Date == "2007-02-01"|Date == "2007-02-02")
"create plot3"
plot(subdata$DateTime,subdata$Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab = "")
points(subdata$DateTime,subdata$Sub_metering_2,type = "l", col = "red")
points(subdata$DateTime,subdata$Sub_metering_3,type = "l", col = "blue")
legend("topright",inset=.04, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)
"copy"
dev.copy(png, file = "plot3.png", height = 480, width = 480)
"disconnect"
dev.off()
