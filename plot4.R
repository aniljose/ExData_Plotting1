# Load the data from delimited text file
power_data <- read.delim("exdata_data_household_power_consumption/household_power_consumption.txt",sep = ";"
                         , header=T, colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric',
                                                    'numeric', 'numeric', 'numeric'),na.strings='?')
# Format Data
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")
#Subset the data from dates '2017-02-01' and '2007-02-02'
power_data_sub <- power_data[power_data$Date == '2007-02-01'|power_data$Date == '2007-02-02',]
# Add a time stamp column to plotting time series
power_data_sub$DateTime <- strptime(paste(power_data_sub$Date, power_data_sub$Time), "%Y-%m-%d %H:%M:%S")

par(mfcol = c(2,2))
# Build time series Plot1
plot(power_data_sub$DateTime, 
     power_data_sub$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(power_data_sub$DateTime, power_data_sub$Global_active_power)

#plot 2 
plot(power_data_sub$DateTime, 
     power_data_sub$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(power_data_sub$DateTime, power_data_sub$Sub_metering_1)
lines(power_data_sub$DateTime, power_data_sub$Sub_metering_2, col='red')
lines(power_data_sub$DateTime, power_data_sub$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

# Plot 3
plot(power_data_sub$DateTime, 
     power_data_sub$Voltage, 
     pch=NA, 
     xlab="datetime", 
     ylab="Voltage")
lines(power_data_sub$DateTime, power_data_sub$Voltage)

# Plot 4
plot(power_data_sub$DateTime, 
     power_data_sub$Global_reactive_power, 
     pch=NA, 
     xlab="datetime", 
     ylab="Global_reactive_power")
lines(power_data_sub$DateTime, power_data_sub$Global_reactive_power)

#Copy to a file
dev.copy(png,"plot4.png", width = 480, height = 480)
dev.off()
