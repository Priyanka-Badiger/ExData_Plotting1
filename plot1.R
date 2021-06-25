## Load Libraries 
library(ggplot2)
library(lubridate)
library(dplyr)

## Load Data 
## Create data directory

if(!dir.exists("data")) { dir.create("data") }

## Download and unzip data file

file.url   <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file.path  <- "data/household_power_consumption.zip"
file.unzip <- "data/household_power_consumption.txt"

if(!file.exists(file.path) & !file.exists(file.unzip)) {
  download.file(file.url, file.path)
  unzip(file.path, exdir = "data")
}

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      +                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
hist(data1$Global_active_power, main="Global Active Power", 
       +      xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()
