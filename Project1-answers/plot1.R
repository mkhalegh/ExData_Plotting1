setwd("./Documents/R-working-directory/")
power <- read.table("household_power_consumption.txt", header=T, sep=";", na.string="?")
plot1<-hist(power$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()

