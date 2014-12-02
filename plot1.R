## This program takes the observations from the electric power consumption dataset
## of dates 2007-02-01 and 2007-02-02 and plots the histogram of global active power values.
##
## Input: household_power_consumption.txt (description in README.md)
##
## Output: ExData_Plotting1/plot1.png

## Reads the dataset
fn <- "household_power_consumption.txt"
df <- read.csv (fn, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## Subset the requested dates
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]

## Graphic output to png file
png (filename = "ExData_Plotting1/plot1.png", width = 480, height = 480)

## Histogram
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## Close graph device
dev.off()