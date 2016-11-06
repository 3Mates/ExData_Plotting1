#####Text file read#####
mydata1 = read.table("household.txt", header=T, sep=";")
mydata1
#####Filtering the data######
mydata1$Date <- as.Date(mydata1$Date, format="%d/%m/%Y")
new2 <- mydata1[(mydata1$Date=="2007-02-01") | (mydata1$Date=="2007-02-02"),]
new2$Global_active_power <- as.numeric(as.character(new2$Global_active_power))
new2$Global_reactive_power <- as.numeric(as.character(new2$Global_reactive_power))
new2$Voltage <- as.numeric(as.character(new2$Voltage))
new2 <- transform(new2, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
new2$Sub_metering_1 <- as.numeric(as.character(new2$Sub_metering_1))
new2$Sub_metering_2 <- as.numeric(as.character(new2$Sub_metering_2))
new2$Sub_metering_3 <- as.numeric(as.character(new2$Sub_metering_3))
######Plotting Plot2######
plot2 <- plot(new2$timestamp,new2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()