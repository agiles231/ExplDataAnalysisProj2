setwd("~/R/RWorkingDir/ExploratoryDataAnalysisCourse/Proj2/")
source("proj2.R")

motVehicleCode <- dataCode$SCC[grep("[Vv]ehicle"
                                    , as.character(dataCode$EI.Sector))]

baltArea <- emisData[emisData$fips=="24510",]
motVehicleEmissionData <- baltArea[baltArea$SCC %in% motVehicleCode,]
sumVec <- c(sum(motVehicleEmissionData$Emissions[motVehicleEmissionData$year==1999])
            , sum(motVehicleEmissionData$Emissions[motVehicleEmissionData$year==2002])
            , sum(motVehicleEmissionData$Emissions[motVehicleEmissionData$year==2005])
            , sum(motVehicleEmissionData$Emissions[motVehicleEmissionData$year==2008]))

x <- c(1999, 2002, 2005, 2008)
png("plot5.png", 480, 480)
plot(c(1999, 2002, 2005, 2008), sumVec, col="blue"
     , main="Motor Vehicle PM2.5 Emissions for Baltimore"
     , ylab="PM2.5 Sum for Year (Tons)", xlab="Year", xaxt="n", ylim=c(0,350))
axis(side=1, at=seq(1999,2008,3), labels=as.character(x))
abline(lm(sumVec ~ x), col="blue")
dev.off()