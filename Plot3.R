## This R script will process the household_power_consumption.txt file and generate plots, specifically plot3.png..
## This script will also generated a plot in png format and save to the getwd() directory.

## Below will import the text file into ALL_ENERGY_DATA, will separate by ";" and will not import those rows with "?" for missing.
ALL_ENERGY_DATA <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?") 

## Below will create a smaller data set of only those dates required.
SHORT_ENERGY_DATA <-rbind(ALL_ENERGY_DATA[ALL_ENERGY_DATA$Date=="1/2/2007",],ALL_ENERGY_DATA[ALL_ENERGY_DATA$Date=="2/2/2007",])

## Format Date as a D / M / Y format
SHORT_ENERGY_DATA$Date <- as.Date(SHORT_ENERGY_DATA$Date,"%d/%m/%Y")

## bind columns Date and Time to create DateTime column (a combined date/time formatted column)
SHORT_ENERGY_DATA<-cbind(SHORT_ENERGY_DATA, "DateTime" = as.POSIXct(paste(SHORT_ENERGY_DATA$Date, SHORT_ENERGY_DATA$Time)))



## Generate the plot with sub metering 1 thru 3, line color, and legend placement.
with(SHORT_ENERGY_DATA, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
lines(SHORT_ENERGY_DATA$Sub_metering_2 ~ SHORT_ENERGY_DATA$DateTime, col = 'Red')
lines(SHORT_ENERGY_DATA$Sub_metering_3 ~ SHORT_ENERGY_DATA$DateTime, col = 'Blue')

## legend box formatting
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7)


## Create png copy of screen plot and save as Plot3.png
dev.copy(png,'plot3.png', width = 480, height = 480)

## always dev.off!
dev.off()