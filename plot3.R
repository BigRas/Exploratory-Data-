library(ggplot2)

BaltimoreNEI <- subset(NEIdata,fips=="24510")
ggplot(BaltimoreNEI,aes(factor(year),Emissions,fill=type)) + geom_bar(stat="identity") +  theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") +    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Emissions, Baltimore City betwenn 1999 and 2008 by Source Type"))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("Plot3.png has been imported to ", getwd()) ## save to current directory
