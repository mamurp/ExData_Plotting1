## Global active power graphs for power consumption 
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
## plot2, copy to new file
with(pwr3, plot(datetime, Global_active_power, type = "l", xlab="",ylab="Global Active Power (kilowatts)"))
## graphics device  
dev.copy(png, file = "plot2.png")
dev.off()
