data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataRequired <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

formattedDT <- strptime(paste(dataRequired$Date, dataRequired$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActvPower <- as.numeric(dataRequired$Global_active_power)
globalReactvPower <- as.numeric(dataRequired$Global_reactive_power)
voltage <- as.numeric(dataRequired$Voltage)

subMetering_1 <- as.numeric(dataRequired$Sub_metering_1)
subMetering_2 <- as.numeric(dataRequired$Sub_metering_2)
subMetering_3 <- as.numeric(dataRequired$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(formattedDT, globalActvPower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(formattedDT, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(formattedDT, subMetering_1, type="l", ylab="Energy Submetering", xlab="")

lines(formattedDT, subMetering_2, type="l", col="red")
lines(formattedDT, subMetering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(formattedDT, globalReactvPower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()