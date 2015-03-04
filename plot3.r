# Import Data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Filter Data
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007" , ]

# Preparing Data
data$Datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %T")
data$Date <- NULL
data$Time <- NULL
Sys.setlocale("LC_TIME","English")

# Plot
png(filename = "plot3.png", width = 480, height = 480)
with(data, {
  plot(Datetime, Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering")  
  lines(Datetime, Sub_metering_2, col = "Red")
  lines(Datetime, Sub_metering_3, col = "Blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("Black", "Red", "Blue"), lwd = 1)
})
dev.off()
