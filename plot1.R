"script for Plot 1"
"load data"
mydata <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
"load dplyr package"
library(dplyr)
"store Date as date"
mydata <- mutate(mydata,Date = as.Date(Date,"%d/%m/%Y"))
"select subset of data"
subdata <- filter(mydata,Date == "2007-02-01"|Date == "2007-02-02")
"make glabal active power a numeric value"
subdata <- mutate(subdata, Global_active_power = as.numeric(Global_active_power))
"create plot1"
hist(subdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
"copy"
dev.copy(png, file = "plot1.png", height = 480, width = 480)
"disconnect"
dev.off()
