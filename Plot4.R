# Load data
EPCData <- read.csv2(file = "household_power_consumption.txt")

# Preprocess data
EPCData$Date <- as.Date(EPCData$Date, format = "%d/%m/%Y")
EPCData$Global_active_power <- as.numeric(levels(EPCData$Global_active_power))[EPCData$Global_active_power]
EPCData$Global_reactive_power <- as.numeric(levels(EPCData$Global_reactive_power))[EPCData$Global_reactive_power]
EPCData$Voltage <- as.numeric(levels(EPCData$Voltage))[EPCData$Voltage]
EPCData$Sub_metering_1 <- as.numeric(levels(EPCData$Sub_metering_1))[EPCData$Sub_metering_1]
EPCData$Sub_metering_2 <- as.numeric(levels(EPCData$Sub_metering_2))[EPCData$Sub_metering_2]
EPCData$Sub_metering_3 <- as.numeric(levels(EPCData$Sub_metering_3))[EPCData$Sub_metering_3]

# Subset data
EPCSubset <- subset(EPCData, Date == "2007-02-01" | Date == "2007-02-02")
EPCSubset$DateTime <- strptime(paste(EPCSubset$Date, EPCSubset$Time), format = "%Y-%m-%d %H:%M:%S")
rm(EPCData)

# Plot 4
png(file="plot4.png",width=480,height=480)

par(mfrow = c(2,2))

with(EPCSubset, plot(x = DateTime,
                     y = Global_active_power,
                     type = "n",
                     xlab = "",
                     ylab = "Global Active Power"))
with(EPCSubset, lines(x = DateTime,
                      y = Global_active_power,
                      type = "l"))

with(EPCSubset, plot(x = DateTime,
                     y = Voltage,
                     type = "n",
                     xlab = "",
                     ylab = "Voltage"))
with(EPCSubset, lines(x = DateTime,
                      y = Voltage,
                      type = "l"))

with(EPCSubset, plot(x = DateTime,
                     y = Sub_metering_1,
                     type = "n",
                     xlab = "",
                     ylab = "Energy sub metering"))
with(EPCSubset, lines(x = DateTime,
                      y = Sub_metering_1,
                      type = "l"))
with(EPCSubset, lines(x = DateTime,
                      y = Sub_metering_2,
                      type = "l",
                      col = "red"))
with(EPCSubset, lines(x = DateTime,
                      y = Sub_metering_3,
                      type = "l",
                      col = "blue"))
legend("topright", 
       lty = c(1,1,1),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       xpd = TRUE,
       bty = "n")

with(EPCSubset, plot(x = DateTime,
                     y = Global_reactive_power,
                     type = "n",
                     xlab = ""))
with(EPCSubset, lines(x = DateTime,
                      y = Global_reactive_power,
                      type = "l"))

dev.off()