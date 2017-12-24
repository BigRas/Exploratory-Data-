setwd("C://HARD//work//JohnH/c4p2")
getwd()

url.file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip?lipi=urn%3Ali%3Apage%3Ad_flagship3_pulse_read%3B%2FmwmXOyVRfOITWuTHf3Bfg%3D%3D"
download.file(url.file,destfile="summarySCC_PM25.rds")

unzip("C:\\HARD\\work\\JohnH\\c4p2\\exdata_Fdata_FNEI_data.zip")

NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")
Emissions  <- aggregate(Emissions ~ year,NEIdata, sum)

barplot((Emissions$Emissions)/10^6,names.arg=Emissions$year,xlab="Year",ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From All US Sources")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png has been imported to ", getwd()) ## save to current directory


