## This R script will process the household_power_consumption.txt file and generate plots, specifically 
## plot 1.png
## This script will also generated a plot in png formet and save to the getwd() directory.

## Below will import the text file into ALL_ENERGY_DATA, will separate by ";" and will not import those rows with "?" for missing.
ALL_ENERGY_DATA <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?") 

## Below will create a smaller data set of only those dates required.
SHORT_ENERGY_DATA <-rbind(ALL_ENERGY_DATA[ALL_ENERGY_DATA$Date=="1/2/2007",],ALL_ENERGY_DATA[ALL_ENERGY_DATA$Date=="2/2/2007",])

## Create histgram from SHORT_ENERGY_DATA.
hist(as.numeric(SHORT_ENERGY_DATA$Global_active_power), col="Red", main="Global Active Power", 
     xlab="Global Active power (kilowatts)", ylab="Frequency")

## Create png copy of screen histogram and save as Plot1.png
dev.copy(png,'plot1.png',  width = 480, height = 480)

## always dev.off!
dev.off()
