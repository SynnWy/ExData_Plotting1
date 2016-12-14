data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataRequired <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

formattedDT <- strptime(paste(dataRequired$Date, dataRequired$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActvPower <- as.numeric(dataRequired$Global_active_power)
png("plot2.png", width=480, height=480)
plot(formattedDT, globalActvPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()