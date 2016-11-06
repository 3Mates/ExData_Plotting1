#####Text file read#####
mydata3 = read.table("household.txt", header=T, sep=";")
mydata3
#####Filtering the data######
mydata3$Date <- as.Date(mydata3$Date, format="%d/%m/%Y")
new3 <- mydata3[(mydata3$Date=="2007-02-01") | (mydata3$Date=="2007-02-02"),]
new3$Global_active_power <- as.numeric(as.character(new3$Global_active_power))
new3$Global_reactive_power <- as.numeric(as.character(new3$Global_reactive_power))
new3$Voltage <- as.numeric(as.character(new3$Voltage))
new3 <- transform(new3, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
new3$Sub_metering_1 <- as.numeric(as.character(new3$Sub_metering_1))
new3$Sub_metering_2 <- as.numeric(as.character(new3$Sub_metering_2))
new3$Sub_metering_3 <- as.numeric(as.character(new3$Sub_metering_3))
######Plotting Plot 3######
plot3 <- plot(new3$timestamp,new3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(new3$timestamp,new3$Sub_metering_2,col="red")
lines(new3$timestamp,new3$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

