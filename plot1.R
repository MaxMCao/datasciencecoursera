# open the downloaded dataset
mydata <- read.table(text=grep("^[1,2]/2/2007",
                          readLines("household_power_consumptio.txt"),
                          value=T),
                    header=T,sep=";",na.string="?",
                    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),)
names(mydata)

# plot in PNG
png(filename="plto1.png",width=480,height=480,units="px")
hist(mydata$Global_active_power, col = "red", 
     main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")
dev.off()

