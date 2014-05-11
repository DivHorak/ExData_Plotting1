# plot1.R

pcon <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

pcon$DateTime <- strptime(paste(pcon$Date, pcon$Time), "%d/%m/%Y %H:%M:%S")
pcon <- subset(pcon, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot1.png", height=480, width=480)

hist(pcon$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

dev.off()
