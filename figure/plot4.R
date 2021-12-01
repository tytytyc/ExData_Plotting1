library(data.table)
setwd("D:\\study\\exploratory_data_analysis")

# Loading the data
d1=fread(input = "household_power_consumption.txt", na.strings="?")
d2=subset(d1, Date %in% c("1/2/2007", "2/2/2007"))
d2$dt=paste(d2$Date, d2$Time)
d2$dt=as.POSIXct(d2$dt, format = "%d/%m/%Y %H:%M:%S")

# Making Plots
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# plot 1
plot(x = d2$dt,
     y = d2$Global_active_power,
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

# plot 2
plot(x = d2$dt,
     y = d2$Voltage,
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

# plot 3
plot(x = d2$dt,
     y = d2$Sub_metering_1,
     type="l", 
     xlab="", 
     ylab="Energy sub metering")

lines(x = d2$dt,
      y = d2$Sub_metering_2,
      col = "red")

lines(x = d2$dt,
      y = d2$Sub_metering_3,
      col = "blue")

legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1), bty="n")

# plot 4
with(d2, 
     plot(x = dt,
     y = Global_active_power,
     type="l", 
     xlab="datetime"))


dev.off()
