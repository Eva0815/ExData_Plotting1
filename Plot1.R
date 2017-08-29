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

# Plot 1
png(file="plot1.png",width=480,height=480)

with(EPCSubset, hist(x = Global_active_power,
                   main = "Global Active Power", 
                   xlab = "Global Active Power (kilowatts)",
                   xlim = c(0,7),
                   col = "red",
                   xaxt = "n",
                   yaxt = "n"))
axis(side = 1, at = c(0,2,4,6))
axis(side = 2, at = seq(0,1200,by=200))

dev.off()