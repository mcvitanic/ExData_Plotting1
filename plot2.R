# check what is working directory
#getwd()
# load data from file in wokringdirectory/w1 into data
dataFile <- "./w1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# make a subset of data that contains 01.02.2007 and 02.02.2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# check how subSetData looks like
#str(subSetData)

# plot2 specific code:

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

# put output into "plot2.png" file
png("plot2.png", width=480, height=480)

# make a graph with y axis label "Global Active Power (kilowatts)"
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the file
dev.off()