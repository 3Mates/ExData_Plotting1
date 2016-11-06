#####Text file read#####
mydata = read.table("household.txt", header=T, sep=";")
mydata
#####Filtering the data######
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
new1 <- mydata[(mydata$Date=="2007-02-01") | (mydata$Date=="2007-02-02"),]
new1$Global_active_power <- as.numeric(as.character(new1$Global_active_power))
new1$Global_reactive_power <- as.numeric(as.character(new1$Global_reactive_power))
new1$Voltage <- as.numeric(as.character(new1$Voltage))
new1 <- transform(new1, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
new1$Sub_metering_1 <- as.numeric(as.character(new1$Sub_metering_1))
new1$Sub_metering_2 <- as.numeric(as.character(new1$Sub_metering_2))
new1$Sub_metering_3 <- as.numeric(as.character(new1$Sub_metering_3))
######Plotting the Plot1 histogram#######
plot1 <- hist(new1$Global_active_power, main = ("Global Active Power"), col="red", border = "black", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
