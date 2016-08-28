#load in the data and then extract the days we need
data <- read.table('household_power_consumption.txt', header = TRUE,
                   sep = ';', stringsAsFactors = FALSE)
df <- data[(data$Date == '1/2/2007') | (data$Date == '2/2/2007'),]
rm('data')

#plot our histogram and save as png
png('plot1.png')
hist(as.numeric(df$Global_active_power), breaks = 20, col = 'red',
     xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency',
     main = 'Global Active Power')
dev.off()