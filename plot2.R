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
png('plot2.png')
plot(df$datetime, df$Global_active_power, type = 'n',
     xlab = '', ylab = 'Global Active Power (kilowatts)')
lines(df$datetime, df$Global_active_power)
dev.off()