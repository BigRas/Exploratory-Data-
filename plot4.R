library(ggplot2)
NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")

names(SCCdata)<-gsub("\\.","", names(SCCdata))
SCCcombustion<-grepl(pattern = "comb", SCCdata$SCCLevelOne, ignore.case = TRUE)
SCCCoal<-grepl(pattern = "coal", SCCdata$SCCLevelFour, ignore.case = TRUE)

CoalCombustionSCC<-SCCdata[SCCcombustion & SCCCoal,]$SCCdata
NEICoalCombustion<-NEIdata[NEIdata$SCCdara %in% CoalCombustionSCC,]
CoalCombustion<-aggregate(Emissions~year, NEICoalCombustion, sum)

g<-ggplot(aes(year, Emissions/10^5), data=CoalCombustion)
g+geom_bar(stat="identity",fill="grey",width=0.75) +
        guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
        labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("Plot4.png has been imported to ", getwd()) ## save to current directory
