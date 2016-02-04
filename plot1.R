## setwd("./ExploreGraph")
pwr <- read.csv2("household_power_consumption.txt", colClasses="character")
## read in data
## convert character Date Time to POSIX z
datetime <- paste(pwr$Date,pwr$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
pwr2 <- cbind(pwr,datetime)
## set limits for subseting   
tt <- strptime("01/02/2007 00:00:01", "%d/%m/%Y %H:%M:%S"  )
tu <- strptime("02/02/2007 23:59:59", "%d/%m/%Y %H:%M:%S")
pwr3 <- subset(pwr2, pwr2$datetime >= tt & pwr2$datetime <= tu)
pwr3$Global_active_power <- as.numeric(pwr3$Global_active_power)
## labels and plot
hist(pwr3$Global_active_power, col="orangered3", main = "Global Active Power", xlab = "Global Active Power  (kilowatts)")
## graphics device  
dev.copy(png, file = "plot1.png")
dev.off()


