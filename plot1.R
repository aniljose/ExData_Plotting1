power_data <- read.delim("exdata_data_household_power_consumption/household_power_consumption.txt",sep = ";"
                         , header=T, colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric',
                                        'numeric', 'numeric', 'numeric'),na.strings='?')
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")
power_data_sub <- power_data[power_data$Date == '2007-02-01'|power_data$Date == '2007-02-02',]
power_data_sub$DateTime <- strptime(paste(power_data_sub$Date, power_data_sub$Time), "%Y-%m-%d %H:%M:%S")
hist(power_data_sub$Global_active_power, freq = T, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()