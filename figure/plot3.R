mydata <- read.table("household_power_consumption.txt",na.strings = "?",sep = ";",header = TRUE)
mydatasubset <- subset(mydata, as.Date(mydata$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(mydata$Date, "%d/%m/%Y") <= "2007-02-02" )
png(file="plot3.png", width = 480, height = 480, units = "px")
with(mydatasubset, plot(as.POSIXct(paste(as.Date(mydatasubset$Date, "%d/%m/%Y"), mydatasubset$Time), format="%Y-%m-%d %H:%M:%S"),mydatasubset$Sub_metering_1,type="l", xlab = "", ylab = "Energy Sub Metering"))
lines(as.POSIXct(paste(as.Date(mydatasubset$Date, "%d/%m/%Y"), mydatasubset$Time), format="%Y-%m-%d %H:%M:%S"), mydatasubset$Sub_metering_2, col="red")
lines(as.POSIXct(paste(as.Date(mydatasubset$Date, "%d/%m/%Y"), mydatasubset$Time), format="%Y-%m-%d %H:%M:%S"), mydatasubset$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),col=c("black","red", "blue"), lwd=1, lty=c(1))
dev.off()
