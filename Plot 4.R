library(ggplot2)
library(dbplyr)
library(lubridate)
data <- read.table("/Users/elaine/Desktop/Data sets/Exploratory Data Analysis Project 1/household_power_consumption.txt",na.strings="?", header=T, sep=";")
#change Date column to class "date"
data$Date<-dmy(data$Date)
#subset only 2 days of data
newdata<-subset(data,data$Date >= "2007-02-01" & data$Date <="2007-02-02")
#remove incomplete data
newdata <- newdata[complete.cases(newdata),]
#combine Date and Time 
newdata$DateTime =paste(newdata$Date, newdata$Time)
newdata$DateTime<- ymd_hms(newdata$DateTime)

par(mfrow=c(2,2),mar = c(4, 4, 2, 1))
#1
with(newdata, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
#2
with(newdata, plot(DateTime, Voltage, type="l"))
#3
with(newdata, plot(DateTime, Sub_metering_1,  type="l", xlab="", ylab="Energy sub metering"))
with(newdata, points(DateTime, Sub_metering_2,  type="l",col="red"))
with(newdata, points(DateTime, Sub_metering_3,  type="l",col="blue"))
legend("topright", lty=1, col= c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lty = 0 )
#4
with(newdata, plot(DateTime, Global_reactive_power, type="l"))
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()

