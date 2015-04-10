setwd("./Documents/R-working-directory/")
power <- read.table("household_power_consumption.txt", header=T, sep=";", na.string="?")
D<-as.POSIXct(paste(power$Date,power$Time))
DF<-transform (power[(D=="2007-02-01")|(D=="2007-02-02"),], D=as.POSIXct(paste(Date,Time)), "%d/%m/%Y %H:%M:%S")
plot2<-plot(DF$D,DF$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()


