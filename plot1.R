library(lubridate)  # package: date & time management

# reading the uncompressed file:
data <- read.csv("./household_power_consumption.txt", sep = ";", dec = ".", na.strings = "?")
# and subsetting it sur the 2 expected dates:
data <- subset(data, dmy(data$Date) == dmy("01-feb-2007") | dmy(data$Date) == dmy("02-feb-2007"))

# plotting the data:
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kW)")

# generating the png file:
dev.copy(png, width = 480, height = 480, file = "plot1.png")
dev.off()
