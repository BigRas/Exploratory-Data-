

BaltimoreNEI <- subset(NEIdata,fips=="24510")

Emissions  <- aggregate(Emissions ~ year,BaltimoreNEI, sum)

barplot((Emissions$Emissions)/10^6,names.arg=Emissions$year,xlab="Year",ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From All Balitimore Sources")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("Plot2.png has been imported to ", getwd()) ## save to current directory
