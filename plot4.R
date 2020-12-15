library(lubridate)  # package: date & time management

# reading the uncompressed file:
data <- read.csv("./household_power_consumption.txt", sep = ";", dec = ".", na.strings = "?")
# and subsetting it sur the 2 expected dates:
data <- subset(data, dmy(data$Date) == dmy("01-feb-2007") | dmy(data$Date) == dmy("02-feb-2007"))
data$Datetime <- dmy_hms(paste(data$Date,data$Time))

# plotting the data:
par(mar = c(4,4,2,2))
par(mfrow = c(2,2))

#1st:
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "Time", ylab = "Global Active Power")

#2nd:
plot(data$Datetime, data$Voltage, type = "l", xlab = "Time", ylab = "Voltage")

# 3rd:
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "Time", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n", inset = c(0.1, 0.01), cex = 0.8, seg.len = 3 )

#4th:
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "Time", ylab = "Global Reactive Power")

# generating the png file:
dev.copy(png, width = 480, height = 480, file = "plot4.png")
dev.off()
