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

# convert date/times from character vector formats to date/POSIXlt format
gpc$Date <- as.Date(gpc$Date, "%d/%m/%Y")
gpc$Time <- strptime(paste(gpc$Date, gpc$Time), format = "%Y-%m-%d %H:%M:%S")

with(gpc, plot(Time, Global_active_power, ylab = 
"Global Active Power (kilowatts)", type = "l"))

# create png file of graph
dev.copy(png, file = "plot2.png")
dev.off()