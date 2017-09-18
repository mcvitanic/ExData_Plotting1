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

globalActivePower <- as.numeric(subSetData$Global_active_power)

# put output into "plot1.png" file
png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close the file
dev.off()