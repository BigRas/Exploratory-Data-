NEIdata$year <- factor(NEIdata$year, levels=c('1999', '2002', '2005', '2008'))

MotorVehicle <- subset(NEIdata, fips == 24510 & type == 'ON-ROAD')

MVOR <- aggregate(MotorVehicle[, 'Emissions'], by=list(MotorVehicle$year), sum)
colnames(MVOR) <- c('year', 'Emissions')

library(ggplot2)
ggplot(data=MVOR, aes(x=year, y=Emissions)) + geom_bar(stat="identity", aes(fill=year)) + guides(fill=F) + 
        ggtitle('Emissions from motor vehicle sources changed from 1999-2008 in Baltimore City') + 
        ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
        geom_text(aes(label=Emissions, size=2, hjust=1, vjust=2)) 




dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()
cat("Plot5.png has been imported to ", getwd()) ## save to current directory
