png("Plot4.png")
par(mfrow=c(2,2))

with(power, plot(DTS,Global_active_power, type = 'l', xlab='',ylab='Global Active Power'))

with(power, plot(DTS,Voltage, type = 'l', ylab='Voltage', xlab='datetime'))

with(power, plot(DTS, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
with(power, lines(DTS, Sub_metering_2, col='red'))
with(power, lines(DTS, Sub_metering_3, col='blue'))
legend("topright", lty=1,  col = c("black", "red", "blue"), legend = names(power[7:9]), bty='n', xjust=1, yjust = 1)


with(power, plot(DTS,Global_reactive_power, type = 'l',  xlab='datetime'))
dev.off()
