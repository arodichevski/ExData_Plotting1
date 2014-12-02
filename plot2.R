## This program takes the observations from the electric power consumption dataset
## of dates 2007-02-01 and 2007-02-02 and plots the time series of global active power values.
##
## Input: household_power_consumption.txt (description in README.md)
##
## Output: ExData_Plotting1/plot2.png

## Reads the dataset
fn <- "household_power_consumption.txt"
df <- read.csv (fn, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## Subset the requested dates
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]

## Convert data and time strings into datetime
df$ts <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

## Graphic output to png file
png (filename = "ExData_Plotting1/plot2.png", width = 480, height = 480)

## Plot the time series of global active power
Sys.setlocale("LC_TIME", "en_US.UTF-8")
plot (df$ts, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Close graph device
dev.off()