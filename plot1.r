# Import Data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Filter Data
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007" , ]

# Preparing Data
data$Datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %T")
data$Date <- NULL
data$Time <- NULL

# Plot
png(filename = "plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, col = "RED", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"))
dev.off()
