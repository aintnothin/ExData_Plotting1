
##  Steve Burch  Jan 11, 2015

setwd("E:/MyStuff/Myfiles/Coursera/4_ExploratoryDataAnalysis/ProgAssgn_1")

#
# read and prep the data
#
fil <- "household_power_consumption.txt"
df0 <- read.table(fil, header = TRUE, sep =';', stringsAsFactors = FALSE)
df <- subset(df0, Date == '1/2/2007' | Date == '2/2/2007')
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
# Sub_metering_3 was read in as numeric...

# make a DateTime column
df$myDateTime <- as.POSIXct(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S", tz="America/Los_Angeles")


#3
png("plot3.png", width = 480, height = 480)
plot(df$myDateTime, df$Sub_metering_1, main = "", type = "n", xlab = "", ylab = "Energy sub metering")
lines(df$myDateTime, df$Sub_metering_1, ylab = "Energy Sub metering", type='l', col='black')
lines(df$myDateTime, df$Sub_metering_2, ylab = "Energy Sub metering", type='l', col='red')
lines(df$myDateTime, df$Sub_metering_3, ylab = "Energy Sub metering", type='l', col='blue')
legend("topright", lwd=1, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

