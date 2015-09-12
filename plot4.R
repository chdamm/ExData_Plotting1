setwd('E:\\CHRISTIAN\\Documents\\GitHub\\ExData_Plotting1')

# Read data
data <- read.csv('household_power_consumption.txt', sep = ';', na.strings = "?", stringsAsFactors = FALSE)

# Only use observations from 2007-02-01 and 2007-02-02
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Combine date + time in one column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time) 
data$DateTime <- as.POSIXct(datetime) 

# Convert values to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)


# Prepare 2*2 graph matrix
par(mfrow = c(2,2))


# Show graph 1
with(data, plot(DateTime, 
                Global_active_power, 
                type = "l",
                ylab = "Global Active Power",
                xlab = ""))

# Show graph 2
with(data, plot(DateTime, 
                Voltage, 
                type = "l",
                ylab = "Voltage",
                xlab = "datetime"))

# Show graph 3
with(data, plot(DateTime, 
                Sub_metering_1, 
                type = "n",
                ylab = "Energy sub metering",
                xlab = ""))
with(data, lines(DateTime, 
                 Sub_metering_1,
                 col="black"))
with(data, lines(DateTime, 
                 Sub_metering_2, 
                 col="red"))
with(data, lines(DateTime, 
                 Sub_metering_3, 
                 col="blue"))
legend("topright",
       lty = 1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),
       bty = "n")

# Show graph 4
with(data, plot(DateTime, 
                Global_reactive_power, 
                type = "l",
                yaxt="n",
                xlab = "datetime"))
axis(side = 2, 
     at = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5),
     labels = c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5"))
