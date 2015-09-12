setwd('E:\\CHRISTIAN\\Documents\\GitHub\\ExData_Plotting1')

# Read data
data <- read.csv('household_power_consumption.txt', sep = ';', na.strings = "?", stringsAsFactors = FALSE)

# Only use observations from 2007-02-01 and 2007-02-02
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Combine date + time in one column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time) 
data$DateTime <- as.POSIXct(datetime) 

# Convert Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Show graph
with(data, plot(DateTime, 
                Global_active_power, 
                type = "l",
                ylab = "Global Active Power (kilowatts)",
                xlab = ""))
