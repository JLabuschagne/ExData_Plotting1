"script for Plot 2"
"load data"
mydata <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
"load dplyr package"
library(dplyr)
"store Date as date"
mydata <- mutate(mydata,DateTime = as.POSIXct(as.character(paste(mydata$Date, mydata$Time)), format="%d/%m/%Y %H:%M:%S"))
mydata <- mutate(mydata,Date = as.Date(Date,"%d/%m/%Y"))
"select subset of data"
subdata <- filter(mydata,Date == "2007-02-01"|Date == "2007-02-02")
"make glabal active power a numeric value"
subdata <- mutate(subdata, Global_active_power = as.numeric(Global_active_power))
"create plot2"
plot(subdata$DateTime,subdata$Global_active_power, type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")
"copy"
dev.copy(png, file = "plot2.png", height = 480, width = 480)
"disconnect"
dev.off()
