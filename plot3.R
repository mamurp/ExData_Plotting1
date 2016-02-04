## Submetering graphs for power consumption 
pwr <- read.csv2("household_power_consumption.txt", colClasses="character")
## read in data
## convert character Date Time to POSIX datetime
datetime <- paste(pwr$Date,pwr$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
pwr2 <- cbind(pwr,datetime)
## set limits for subseting   
tt <- strptime("01/02/2007 00:00:01", "%d/%m/%Y %H:%M:%S"  )
tu <- strptime("02/02/2007 23:59:59", "%d/%m/%Y %H:%M:%S")
pwr3 <- subset(pwr2, pwr2$datetime >= tt & pwr2$datetime <= tu)
## change to numeric
pwr3$Sub_metering_1 <- as.numeric(pwr3$Sub_metering_1)
pwr3$Sub_metering_2 <- as.numeric(pwr3$Sub_metering_2)
pwr3$Sub_metering_3 <- as.numeric(pwr3$Sub_metering_3)
## plot 3 lines
with(pwr3, plot(datetime, Sub_metering_1, type = "l", col="black", xlab="", ylab="Energy sub metering"))
with(pwr3, lines(datetime, Sub_metering_2, type = "l", col="orangered3"))
with(pwr3, lines(datetime, Sub_metering_3, type = "l", col="blue")) 
## change labels
## add legend
legend("topright",lwd=1,  col=c("black","orangered3","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## graphics device  
dev.copy(png, file = "plot3.png")
dev.off()