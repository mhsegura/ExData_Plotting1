## This R script will process the household_power_consumption.txt file and generate plots, specifically plot2.png..
## This script will also generated a plot in png format and save to the getwd() directory.

## Below will import the text file into ALL_ENERGY_DATA, will separate by ";" and will not import those rows with "?" for missing.
ALL_ENERGY_DATA <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?") 

## Below will create a smaller data set of only those dates required.
SHORT_ENERGY_DATA <-rbind(ALL_ENERGY_DATA[ALL_ENERGY_DATA$Date=="1/2/2007",],ALL_ENERGY_DATA[ALL_ENERGY_DATA$Date=="2/2/2007",])

## Format Date as a D / M / Y format
SHORT_ENERGY_DATA$Date <- as.Date(SHORT_ENERGY_DATA$Date,"%d/%m/%Y")

## bind columns Date and Time to create DateTime column (a combined date/time formatted column)
SHORT_ENERGY_DATA<-cbind(SHORT_ENERGY_DATA, "DateTime" = as.POSIXct(paste(SHORT_ENERGY_DATA$Date, SHORT_ENERGY_DATA$Time)))

## plot with parameters below.
plot(SHORT_ENERGY_DATA$Global_active_power ~ SHORT_ENERGY_DATA$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")

## Create png copy of screen plot and save as Plot2.png
dev.copy(png,'plot2.png', width = 480, height = 480)

## always dev.off!
dev.off()