# plot2.R

setwd("Z:/Shared Docs/Data Science/Files")

pcon <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

pcon$dt <- strptime(paste(pcon$Date, pcon$Time), "%d/%m/%Y %H:%M:%S")

pcon <- subset(pcon, as.Date(dt) >= as.Date("2007-02-01") & as.Date(dt) <= as.Date("2007-02-02"))

png("plot2.png", height=480, width=480)

plot(pcon$dt, pcon$Global_active_power,pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(pcon$dt, pcon$Global_active_power)

dev.off()
