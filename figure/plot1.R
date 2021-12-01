library(data.table)
setwd("D:\\study\\exploratory_data_analysis")

# Loading the data
d1=fread(input = "household_power_consumption.txt", na.strings="?")
d2=subset(d1, Date %in% c("1/2/2007", "2/2/2007"))

# Making Plots
png("plot1.png", width=480, height=480)

hist(d2$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
