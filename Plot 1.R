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


hist(newdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
