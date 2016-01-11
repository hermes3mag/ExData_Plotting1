##Plot3
png("Plot3.png")
with(power, plot(DTS, Sub_metering_1, type='c'))
with(power, lines(DTS, Sub_metering_2, col='red'))
with(power, lines(DTS, Sub_metering_3, col='blue'))
dev.off()