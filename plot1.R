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

# create histogram of Global_active_power variable
with(gpc, hist(Global_active_power, col = "red", 
xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

# create png file of histogram
dev.copy(png, file = "plot1.png")
dev.off()