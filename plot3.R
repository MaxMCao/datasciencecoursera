# open the downloaded dataset
mydata <- read.csv("household_power_consumption.txt", header = T,
                   sep = ';',
                   na.strings = "?",
                   nrows = 2075259)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

# subset the data
mydata <- subset(mydata,
                subset = (Date >= "2007-02-01"
                          & Date <= "2007-02-02"))

# conver the time
datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)

# plot in PNG
png(filename="plto3.png",width=480,height=480,units="px")
with(mydata, {
    plot(Sub_metering_1 ~ Datetime, type = "l",
    ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ Datetime, col = 'Red')
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

