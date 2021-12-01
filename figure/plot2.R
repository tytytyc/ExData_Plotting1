library(data.table)
setwd("D:\\study\\exploratory_data_analysis")

# Loading the data
d1=fread(input = "household_power_consumption.txt", na.strings="?")
d2=subset(d1, Date %in% c("1/2/2007", "2/2/2007"))
d2$dt=paste(d2$Date, d2$Time)
d2$dt=as.POSIXct(d2$dt, format = "%d/%m/%Y %H:%M:%S")

# Making Plots
png("plot2.png", width=480, height=480)

plot(x = d2$dt,
     y = d2$Global_active_power,
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()
