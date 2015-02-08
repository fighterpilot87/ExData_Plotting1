# eda course project 1 plot 4

## Load the dataset. 
## TODO: This could be broken out to a shared function for all plots,
## but I think that's beyond the scope of the assignment.
fileData <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
subsetData <- fileData[fileData$Date %in% c("1/2/2007", "2/2/2007"),]
subsetData$datetime <- paste(subsetData$Date, subsetData$Time)
subsetData$datetime <- strptime(subsetData$datetime, "%d/%m/%Y %H:%M:%S")

## Plot!
png(file="plot4.png", width=480, height=480, units="px", bg="transparent")
par(mfrow=c(2,2))
with(subsetData, {
  ## Some of these label inclusions/deletions seem somewhat 
  ## arbitrary, but this matches the expected result 
  ## provided in the project directions
  plot(datetime, Global_active_power,  type = "l", xlab="", ylab="Global Active Power")
  plot(datetime, Voltage,  type = "l")
  plot(datetime, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Global_reactive_power, type = "l")
})
dev.off()