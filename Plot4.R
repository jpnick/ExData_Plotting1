#plot4
file <- "./Week 1/household_power_consumption.txt"
data <- read.table(file,skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

gap <- as.numeric(as.character(power$Global_active_power))
grp <- as.numeric(as.character(power$Global_reactive_power))
vol <- as.numeric(as.character(power$Voltage))
subm1 <- as.numeric(as.character(power$Sub_metering_1))
subm2 <- as.numeric(as.character(power$Sub_metering_2))
subm3 <- as.numeric(as.character(power$Sub_metering_3))

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power")
plot(datetime, vol, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subm2, type="l", col="red")
lines(datetime, subm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n", lwd=2, col=c("black", "red", "blue"))
plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()