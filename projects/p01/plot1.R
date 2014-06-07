library(data.table)
if(!exists("hcp_data")){
    hcp_data <- data.frame(fread("hpc_feb07_0102.txt"))
    attach(hcp_data, warn.conflicts = F)
}
fullDate <- strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S")

png("plot1.png", width = 480, height = 480, units = "px", bg = NA)
hist(Global_active_power,
     main = "Global active power",
     xlab = "Global active power (kilowatts)",
     col = "red"
     )
dev.off()
