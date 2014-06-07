library(data.table)
if(!exists("hcp_data")){
    hcp_data <- data.frame(fread("hpc_feb07_0102.txt"))
    attach(hcp_data, warn.conflicts = F)
}
fullDate <- strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480, bg = NA)
plot(fullDate, Global_active_power, type = "l",
     xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()
