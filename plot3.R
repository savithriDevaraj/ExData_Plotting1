#Plot 3
library(data.table)
library(graphics)
library(grDevices)
data <- data.table(read.table("./ExData_Plotting1/household_power_consumption.txt", skip=1, sep = ";", quote = "\"", na.strings="?"))
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
##as.Date(data[data$Date], "%d/%m/%y")
limit <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

Limit <- limit[,Date:=as.Date(limit$Date, "%d/%m/%y")]

##newlimit <- within(Limit, { timestamp=strptime(as.character(limit$Date), as.character(limit$Time))), "%d/%m/%Y %H:%M:%S") })
newlimit <- within(Limit, { timestamp=format(as.POSIXct(paste(as.character(Limit$Date), as.character(Limit$Time))), "%d/%m/%Y %H:%M:%S") })

yrange<-range(c(newlimit$Sub_metering_1, newlimit$Sub_metering_2, newlimit$Sub_metering_3))
with (newlimit, plot(strptime(timestamp,"%d/%m/%Y %H:%M:%S") ,Sub_metering_1, type="l", ylim=yrange, xlab="",ylab="Energy Sub metering"))
par(new=TRUE)
with (newlimit, plot(strptime(timestamp,"%d/%m/%Y %H:%M:%S") ,Sub_metering_3, type="l", ann=FALSE, ylim = yrange, axes=F,col="blue"))
par(new=TRUE)
with (newlimit, plot(strptime(timestamp,"%d/%m/%Y %H:%M:%S") ,Sub_metering_2, type="l", ann=FALSE, ylim = yrange, axes=F,col="red"))
legend("topright",  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","red","blue")) 

dev.copy(png, file="./ExData_Plotting1/plot3.png")

par(new=FALSE)
dev.off()
