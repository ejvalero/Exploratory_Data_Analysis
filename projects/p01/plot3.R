library(data.table)
if(!exists("hcp_data")){
    hcp_data <- data.frame(fread("hpc_feb07_0102.txt"))
    attach(hcp_data, warn.conflicts = F)
}
fullDate <- strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480, units = "px", bg = NA)
plot(fullDate, Sub_metering_1, type = "l",
     xlab = NA, ylab = "Energy sub metering")
lines(fullDate, Sub_metering_2, col = "red")
lines(fullDate, Sub_metering_3, col = "blue")

legend("topright", names(hcp_data)[7:9], lty = "solid",
       col = c("black", "red", "blue"))
dev.off()
