## This program takes the observations from the electric power consumption dataset
## of dates 2007-02-01 and 2007-02-02 and plots four time series.
##
## Input: household_power_consumption.txt (description in README.md)
##
## Output: ExData_Plotting1/plot4.png

## Reads the dataset
fn <- "household_power_consumption.txt"
df <- read.csv (fn, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## Subset the requested dates
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]

## Convert data and time strings into datetime
df$ts <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

## Graphic output to png file
png (filename = "ExData_Plotting1/plot4.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "en_US.UTF-8")

## Two rows, two columns
par(mfcol = c(2, 2))

## Plot the time series of global active power
plot (df$ts, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## Plot the time series of global active power
df$Sub_metering_max <- pmax(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3, na.rm = TRUE)
plot (df$ts, df$Sub_metering_max, type = "n", xlab = "", ylab = "Energy sub metering")
lines (df$ts, df$Sub_metering_1, type = "l", col = "black")
lines (df$ts, df$Sub_metering_2, type = "l", col = "red")
lines (df$ts, df$Sub_metering_3, type = "l", col = "blue")
legend ("topright", lty = 1, bty = "n",
	col = c("black", "red", "blue"),
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

## Plot the time series of voltage
plot (df$ts, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## Plot the time series of voltage
plot (df$ts, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Close graph device
dev.off()