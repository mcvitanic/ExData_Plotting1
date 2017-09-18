# check what is working directory
#getwd()
# load data from file in wokringdirectory/w1 into data
dataFile <- "./w1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# make a subset of data that contains 01.02.2007 and 02.02.2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# check how subSetData looks like
#str(subSetData)

# plot4 specific code:

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# put output into "plot4.png" file
png("plot4.png", width=480, height=480)
# 2 x 2 matrix
par(mfrow = c(2, 2)) 

# first graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# second graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# third graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# fourth graph
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# close the file
dev.off()