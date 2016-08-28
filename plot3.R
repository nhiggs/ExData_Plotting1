#need lubridate for easier datetime processing
library(lubridate)

#load in the data and then extract the days we need
data <- read.table('household_power_consumption.txt', header = TRUE,
                   sep = ';', stringsAsFactors = FALSE)
df <- data[(data$Date == '1/2/2007') | (data$Date == '2/2/2007'),]
rm('data')

#create datetime column
df$Date <- strptime(df$Date, '%d/%m/%Y')
df$Time <- strptime(df$Time, format = '%H:%M:%S')
df$Time <- format(df$Time, format = '%H:%M:%S') #this removes the current date that strptime adds
df$datetime <- ymd_hms(paste(df$Date, df$Time))

#create plot and save as png
png('plot3.png')
plot(df$datetime, df$Sub_metering_1, type = 'n',
     xlab = '', ylab = 'Energy sub metering')
lines(df$datetime, df$Sub_metering_1)
lines(df$datetime, df$Sub_metering_2, col = 'red')
lines(df$datetime, df$Sub_metering_3, col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty = c(1, 1, 1), col = c('black', 'red', 'blue'))
dev.off()