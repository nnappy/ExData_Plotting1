# create names for columns of data to be read (ie names of variables being 
# measured).  This step is not required if you read the whole file in and subset
# the data
colvariables <- c("Date", "Time", "Global_active_power", 
"Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
"Sub_metering_2", "Sub_metering_3")

# read in global power consumption (gpc) data with dates of February 1 - 2, 2007
gpc <- read.table("household_power_consumption.txt", sep = ";", 
col.names = colvariables, stringsAsFactors = FALSE, na.strings = "?", 
skip = 66637, nrows = 2880)

# convert date/times from character vector format to date/POSIXlt formats
gpc$Date <- as.Date(gpc$Date, "%d/%m/%Y")
gpc$Time <- strptime(paste(gpc$Date, gpc$Time), format = "%Y-%m-%d %H:%M:%S")

#open png graphics device
png("plot4.png")

# create 2 x 2 set of graphs
par(mfcol = c(2,2))
with(gpc, plot(Time, Global_active_power, xlab = "", 
ylab = "Global Active Power", type = "l"))

with(gpc, plot(Time, Sub_metering_1, type = "n", xlab = "", 
ylab = "Energy sub metering"))
with(gpc, points(Time, Sub_metering_1, col = "black", type = "l", lwd = 1))
with(gpc, points(Time, Sub_metering_2, col = "red", type = "l", lwd = 1))
with(gpc, points(Time, Sub_metering_3, col = "blue", type = "l", lwd = 1))
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")) 

with(gpc, plot(Time, Voltage, xlab = "datetime", type = "l"))
with(gpc, plot(Time, Global_reactive_power, xlab = "datetime", type = "l"))

# turn graphics device off
dev.off()