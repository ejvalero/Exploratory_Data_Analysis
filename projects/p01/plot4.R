library(data.table)
if(!exists("hcp_data")){
    hcp_data <- data.frame(fread("hpc_feb07_0102.txt"))
    attach(hcp_data, warn.conflicts = F)
}
fullDate <- strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480, units = "px", bg = NA)
par(mfrow = c(2,2))

## Global_reactive_power
plot(fullDate, Global_active_power, type = "l", xlab = NA,
     ylab = "Global active power")

## Voltage
plot(fullDate, Voltage, type = "l", xlab = "datetime")

## Energy sub mastering
plot(fullDate, Sub_metering_1, type = "l",
     xlab = NA, ylab = "Energy sub metering")
lines(fullDate, Sub_metering_2, col = "red")
lines(fullDate, Sub_metering_3, col = "blue")

legend("topright", names(hcp_data)[7:9], lty = "solid",
       col = c("black", "red", "blue"), box.col = NA,
       inset = .01)

## Global reactive power
plot(fullDate, Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global reactive power")

dev.off()
