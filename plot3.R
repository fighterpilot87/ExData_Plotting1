# eda course project 1 plot 3

## Load the dataset. 
## TODO: This could be broken out to a shared function for all plots,
## but I think that's beyond the scope of the assignment.
fileData <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
subsetData <- fileData[fileData$Date %in% c("1/2/2007", "2/2/2007"),]
subsetData$datetime <- paste(subsetData$Date, subsetData$Time)
subsetData$datetime <- strptime(subsetData$datetime, "%d/%m/%Y %H:%M:%S")

## Plot!
png(file="plot3.png", width=480, height=480, units="px", bg="transparent")
with(subsetData, plot(datetime, Sub_metering_1,  type = "l", xlab="", ylab="Energy sub metering"))
with(subsetData, lines(datetime, Sub_metering_2, col="red"))
with(subsetData, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()