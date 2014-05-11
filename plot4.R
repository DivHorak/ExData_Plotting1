# plot4.R 

#setwd("Z:/Shared Docs/Data Science/Files")

pcon <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

pcon$dt <- strptime(paste(pcon$Date, pcon$Time), "%d/%m/%Y %H:%M:%S")
pcon <- subset(pcon, as.Date(dt) >= as.Date("2007-02-01") & as.Date(dt) <= as.Date("2007-02-02"))


png("plot4.png", height=480, width=480)
par(mfrow=c(2,2))


plot(pcon$dt, pcon$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(pcon$dt, pcon$Global_active_power)

plot(pcon$dt, pcon$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(pcon$dt, pcon$Voltage)

plot(pcon$dt, pcon$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(pcon$dt, pcon$Sub_metering_1)
lines(pcon$dt, pcon$Sub_metering_2, col='red')
lines(pcon$dt, pcon$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1),col = c('black', 'red', 'blue'), bty = 'n')

with(pcon, plot(dt, Global_reactive_power, xlab='datetime', pch=NA))
with(pcon, lines(dt, Global_reactive_power))

dev.off()
