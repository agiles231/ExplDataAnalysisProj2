setwd("C:/Users/Andrew/Documents/R/RWorkingDir/ExploratoryDataAnalysisCourse/Proj2/")

# baltArea is the subset of df where fips=="24510" (Baltimore)
baltArea <- emisData[emisData$fips=="24510",]
sumVec <- c(sum(baltArea[baltArea$year==1999,4])
            , sum(baltArea[baltArea$year==2002,4])
            , sum(baltArea[baltArea$year==2005,4])
            , sum(baltArea[baltArea$year==2008,4]))
png("plot2.png", 480, 480)
plot(c(1999, 2002, 2005, 2008),sumVec, xlab="Year"
     , ylab="Emission Sums (Tons)", main = "PM2.5 Emissions data for Baltimore Area")
dev.off()