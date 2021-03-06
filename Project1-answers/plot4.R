setwd("./Documents/R-working-directory/")
power <- read.table("household_power_consumption.txt", header=T, sep=";", na.string="?")
power$Date<-as.Date(power$Date, format="%d/%m/%Y")
D<-as.POSIXct(paste(power$Date,power$Time))
DF<-transform (power[(D=="2007-02-01")|(D=="2007-02-02"),], D=as.POSIXct(paste(Date,Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
plot(DF$D,DF$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(DF$D,DF$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DF$D,DF$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DF$D,DF$Sub_metering_2,col="red")
lines(DF$D,DF$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1,1), bty="n", cex=.6)
plot(DF$D,DF$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()