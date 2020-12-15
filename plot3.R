library(lubridate)  # package: date & time management

# reading the uncompressed file:
data <- read.csv("./household_power_consumption.txt", sep = ";", dec = ".", na.strings = "?")
# and subsetting it sur the 2 expected dates:
data <- subset(data, dmy(data$Date) == dmy("01-feb-2007") | dmy(data$Date) == dmy("02-feb-2007"))
data$Datetime <- dmy_hms(paste(data$Date,data$Time))

# plotting the data:
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "Time", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
# legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
#        col = c("black", "red", "blue"), lty = 1)
# legend(x = dmy_hms("2/02/2007 08:00:00"), y = 40, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
#        col = c("black", "red", "blue"), lty = 1)
 legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col = c("black", "red", "blue"), lty = 1, bty = "n", inset = c(0.1, 0.01), cex = 0.8, seg.len = 3 )
# text.width = hms("14:00:00"),
 
# generating the png file:
dev.copy(png, width = 480, height = 480, file = "plot3.png")
dev.off()
