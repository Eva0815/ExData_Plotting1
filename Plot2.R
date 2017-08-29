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

# Plot 2
png(file="plot2.png",width=480,height=480)

with(EPCSubset, plot(x = DateTime,
                     y = Global_active_power,
                     type = "n",
                     xlab = "",
                     ylab = "Global Active Power (kilowatts)"))
with(EPCSubset, lines(x = DateTime,
                      y = Global_active_power,
                      type = "l"))

dev.off()
