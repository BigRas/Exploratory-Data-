NEIdata$year <- factor(NEIdata$year, levels=c('1999', '2002', '2005', '2008'))

Baltimoremotorvehicle <- subset(NEIdata, fips == '24510' & type == 'ON-ROAD')
BMVH.TO <- aggregate(Baltimoremotorvehicle[, 'Emissions'], by=list(Baltimoremotorvehicle$year), sum)
colnames(BMVH.TO) <- c('year', 'Emissions')
BMVH.TO$City <- paste(rep('MD', 4))


Losangelesmotorvehicle <- subset(NEIdata, fips == '06037' & type == 'ON-ROAD')
LMVH.TO <- aggregate(Losangelesmotorvehicle[, 'Emissions'], by=list(Losangelesmotorvehicle$year), sum)
colnames(LMVH.TO) <- c('year', 'Emissions')
LMVH.TO$City <- paste(rep('CA', 4))


To <- as.data.frame(rbind(BMVH.TO, LMVH.TO)) ## combunition of both sets

ggplot(data=To, aes(x=year, y=Emissions)) + geom_bar(stat="identity", aes(fill=year)) + guides(fill=F) + 
        ggtitle('Compare emissions from motor vehicle sources in Baltimore City with Los Angeles COunty') + 
        ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + facet_grid(. ~ City)



dev.copy(png, file="plot6.png", width=480, height=480)
dev.off()
cat("Plot6.png has been imported to ", getwd()) ## save to current directory
