## eda course project 1 plot 1

## Load the dataset. 
## TODO: This could be broken out to a shared function for all plots,
## but I think that's beyond the scope of the assignment.
fileData <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
subsetData <- fileData[fileData$Date %in% c("1/2/2007", "2/2/2007"),]
subsetData$datetime <- paste(subsetData$Date, subsetData$Time)
subsetData$datetime <- strptime(subsetData$datetime, "%d/%m/%Y %H:%M:%S")

## Plot!
png(file="plot1.png", width=480, height=480, units="px", bg="transparent")
hist(subsetData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()