#Plot 1
library(data.table)
library(graphics)
library(grDevices)
data <- data.table(read.table("./ExData_Plotting1/household_power_consumption.txt", skip=1, sep = ";", quote = "\"", na.strings="?"))
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
##as.Date(data[data$Date], "%d/%m/%y")
limit <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

#Writing to png file directly, 480x480 is default
png("./ExData_Plotting1/plot1.png")
with(limit, hist(Global_active_power, col="red", main ="Global Active Power", xlab="Global Active Power(Kilowatts)"))
dev.off()

# Using the copy command to copy from screen to file
#with(limit, hist(Global_active_power, col="red", main ="Global Active Power", xlab="Global Active Power(Kilowatts)"))
#dev.copy(png, file="./ExData_Plotting1/plot1.png",width = 480, height = 480, units = "px")
#dev.off()

