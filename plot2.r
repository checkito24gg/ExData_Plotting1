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
png(filename = "plot2.png", width = 480, height = 480)
with(data, plot(y = Global_active_power, x = Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA))
dev.off()
