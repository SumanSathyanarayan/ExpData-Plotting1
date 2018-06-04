#Read the data from the file.
dataFromFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFromFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subsetting based on date Range
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plotting based on time.
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()