## 2x2 multiple graphs for power consumption 
pwr <- read.csv2("household_power_consumption.txt", colClasses="character")
## read in data
## convert character Date Time to POSIX z
datetime <- paste(pwr$Date,pwr$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
pwr2 <- cbind(pwr,datetime)
## set limits for subsetting   
tt <- strptime("01/02/2007 00:00:01", "%d/%m/%Y %H:%M:%S"  )
tu <- strptime("02/02/2007 23:59:59", "%d/%m/%Y %H:%M:%S")
pwr3 <- subset(pwr2, pwr2$datetime >= tt & pwr2$datetime <= tu)
## 2 x 2 view
par(mfrow=c(2,2))
##plot2 upper left
with(pwr3, plot(datetime, Global_active_power, type = "l", xlab="", ylab = "Global Active Power"))
##new plot voltage upper right
with(pwr3, plot(datetime, Voltage, type = "l"))
## plot 3 lower left
with(pwr3, plot(datetime, Sub_metering_1, type = "l", col="black", ylab= "Energy sub metering", xlab=""))
with(pwr3, lines(datetime, Sub_metering_2, type = "l", col="orangered3"))
with(pwr3, lines(datetime, Sub_metering_3, type = "l", col="blue")) 
legend("topright", lwd=1, bty="n",  col=c("black","orangered3","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##plot4 lower right
with(pwr3, plot(datetime, Global_reactive_power, type = "l"))
## graphics device  
dev.copy(png, file = "plot4.png")
dev.off()