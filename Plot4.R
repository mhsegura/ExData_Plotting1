## This R script will process the household_power_consumption.txt file and generate plots, specifically plot4.png..
## This script will also generated a plot in png format and save to the getwd() directory.

## Below will import the text file into ALL_ENERGY_DATA, will separate by ";" and will not import those rows with "?" for missing.
ALL_ENERGY_DATA <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?") 

## Below will create a smaller data set of only those dates required.
SHORT_ENERGY_DATA <-rbind(ALL_ENERGY_DATA[ALL_ENERGY_DATA$Date=="1/2/2007",],ALL_ENERGY_DATA[ALL_ENERGY_DATA$Date=="2/2/2007",])

## Format Date as a D / M / Y format
SHORT_ENERGY_DATA$Date <- as.Date(SHORT_ENERGY_DATA$Date,"%d/%m/%Y")

## bind columns Date and Time to create DateTime column (a combined date/time formatted column)
SHORT_ENERGY_DATA<-cbind(SHORT_ENERGY_DATA, "DateTime" = as.POSIXct(paste(SHORT_ENERGY_DATA$Date, SHORT_ENERGY_DATA$Time)))

## contstruct a 2 x 2 plot grid with par.
par(mfrow=c(2,2))

## Begin the 2 x 2 grid of 4 different plots.
with(SHORT_ENERGY_DATA, plot(Global_active_power ~ DateTime, type = "l", xlab = "", ylab = "Global Active Power"))

with(SHORT_ENERGY_DATA, plot(Voltage ~ DateTime, type = "l" , xlab = "datetime", ylab = "Voltage"))

with(SHORT_ENERGY_DATA, {plot(Sub_metering_1 ~ DateTime, type="l", xlab = "", ylab = "Energy Sub Metering")})
lines(SHORT_ENERGY_DATA$Sub_metering_2 ~ SHORT_ENERGY_DATA$DateTime, col = 'Red')
lines(SHORT_ENERGY_DATA$Sub_metering_3 ~ SHORT_ENERGY_DATA$DateTime, col = 'Blue')

## legend box formatting
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.3)

with(SHORT_ENERGY_DATA, plot(Global_reactive_power ~ DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

## Create png copy of screen plot and save as Plot4.png
dev.copy(png,'plot4.png', width = 480, height = 480)

## always dev.off!
dev.off()