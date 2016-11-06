#####Text file read#####
mydata4 = read.table("household.txt", header=T, sep=";")
mydata4
#####Filtering the data######
mydata4$Date <- as.Date(mydata4$Date, format="%d/%m/%Y")
new4 <- mydata4[(mydata4$Date=="2007-02-01") | (mydata4$Date=="2007-02-02"),]
new4$Global_active_power <- as.numeric(as.character(new4$Global_active_power))
new4$Global_reactive_power <- as.numeric(as.character(new4$Global_reactive_power))
new4$Voltage <- as.numeric(as.character(new4$Voltage))
new4 <- transform(new4, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
new4$Sub_metering_1 <- as.numeric(as.character(new4Sub_metering_1))
new4$Sub_metering_2 <- as.numeric(as.character(new4$Sub_metering_2))
new4$Sub_metering_3 <- as.numeric(as.character(new4$Sub_metering_3))
######Plotting Plot 4######
par(mfrow=c(2,2))
######Plot 1######
plot(new4$timestamp,new4$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(new4$timestamp,new4$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(new4$timestamp,new4$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(new4$timestamp,new4$Sub_metering_2,col="red")
lines(new4$timestamp,new4$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1),bty="n", cex=.5)
plot(new4$timestamp,new4$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
