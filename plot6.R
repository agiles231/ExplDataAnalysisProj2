setwd("~/R/RWorkingDir/ExploratoryDataAnalysisCourse/Proj2/")
source("proj2.R")


motVehicleCode <- dataCode$SCC[grep("[Vv]ehicle"
                                    , as.character(dataCode$EI.Sector))]

baltArea <- emisData[emisData$fips=="24510",]
laArea <- emisData[emisData$fips=="06037",]

baltVehicData <- baltArea[baltArea$SCC %in% motVehicleCode,]
baltSumVec <- c(sum(baltVehicData$Emissions[baltVehicData$year==1999])
                , sum(baltVehicData$Emissions[baltVehicData$year==2002])
                , sum(baltVehicData$Emissions[baltVehicData$year==2005])
                , sum(baltVehicData$Emissions[baltVehicData$year==2008]))

laVehicData <- laArea[laArea$SCC %in% motVehicleCode,]
laSumVec <- c(sum(laVehicData$Emissions[laVehicData$year==1999])
                , sum(laVehicData$Emissions[laVehicData$year==2002])
                , sum(laVehicData$Emissions[laVehicData$year==2005])
                , sum(laVehicData$Emissions[laVehicData$year==2008]))
x <- c(1999, 2002, 2005, 2008)
lm_LA <- lm(laSumVec ~ x)
lm_Balt <- lm(baltSumVec ~ x)
png("plot6.png")
plot(x, laSumVec, col="blue", ylim=c(0, 4500), xaxt="n", yaxt="n", xlab="Year"
     , ylab="Emission Sum (Tons)", main=paste("Motor Vehicle PM2.5 Emission "
                                              , "Comparison of Baltimore "
                                              , "and LA", sep="")
     , pch=19)
axis(1, at=c(1999, 2002, 2005, 2008), labels=c("1999", "2002", "2005", "2008"))
axis(2, at=c(0, 400, 3000, 3500, 4000), labels=c("0", "400", "3000", "3500"
                                                 , "4000"), cex.axis=.8)
points(x, baltSumVec, col="red", pch=19)

# add linear regression lines to both sets of emissions to determine
# which has changed more
abline(lm_LA, col="blue")
abline(lm_Balt, col="red")
text(2002, 500, paste("Slope is", as.character(coefficients(lm_Balt)[2]))
     , cex=.8)
text(2002, 3800, paste("Slope is", as.character(coefficients(lm_LA)[2]))
     , cex=.8)
legend(2007, 2000,legend=c("LA", "Baltimore"), pch=c(19, 19)
       , col=c("blue", "red")
       , cex= .7)
coefficients(lm_LA)
coefficients(lm_Balt)
dev.off()