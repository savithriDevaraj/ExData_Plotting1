#Plot 2
library(data.table)
library(graphics)
library(grDevices)
data <- data.table(read.table("./ExData_Plotting1/household_power_consumption.txt", skip=1, sep = ";", quote = "\"", na.strings="?"))
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
##as.Date(data[data$Date], "%d/%m/%y")
limit <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

Limit <- limit[,Date:=as.Date(limit$Date, "%d/%m/%y")]

newlimit <- within(Limit, { timestamp=format(as.POSIXct(paste(as.character(Limit$Date), as.character(Limit$Time))), "%d/%m/%Y %H:%M:%S") })

#writing directly to png file
png("./ExData_Plotting1/plot2.png")
with (newlimit,plot(strptime(timestamp,"%d/%m/%Y %H:%M:%S") ,Global_active_power,type="l", xlab= "",ylab="Global Active Power(Kilowatts)"))
#dev.copy(png, file="./ExData_Plotting1/plot2.png",width = 480, height = 480, units = "px")
dev.off()

