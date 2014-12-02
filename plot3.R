## This program takes the observations from the electric power consumption dataset
## of dates 2007-02-01 and 2007-02-02 and plots the time series of energy sub metering.
##
## Input: household_power_consumption.txt (description in README.md)
##
## Output: ExData_Plotting1/plot3.png

## Reads the dataset
fn <- "household_power_consumption.txt"
df <- read.csv (fn, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## Subset the requested dates
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]

## Convert data and time strings into datetime
df$ts <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

## Calculate maximum value of sub metering
df$Sub_metering_max <- pmax(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3, na.rm = TRUE)

## Graphic output to png file
png (filename = "ExData_Plotting1/plot3.png", width = 480, height = 480)

## Plot the time series of global active power
Sys.setlocale("LC_TIME", "en_US.UTF-8")
plot (df$ts, df$Sub_metering_max, type = "n", xlab = "", ylab = "Energy sub metering")
lines (df$ts, df$Sub_metering_1, type = "l", col = "black")
lines (df$ts, df$Sub_metering_2, type = "l", col = "red")
lines (df$ts, df$Sub_metering_3, type = "l", col = "blue")
legend ("topright", lty = 1,
	col = c("black", "red", "blue"),
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

## Close graph device
dev.off()