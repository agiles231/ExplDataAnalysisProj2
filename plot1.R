setwd("C:/Users/Andrew/Documents/R/RWorkingDir/ExploratoryDataAnalysisCourse/Proj2/")
source("proj2.R")
sumVec <- c(      sum(emisData[emisData$year==1999,4])
                  , sum(emisData[emisData$year==2002,4])
                  , sum(emisData[emisData$year==2005,4])
                  , sum(emisData[emisData$year==2008,4]))

# concatenate a vector that represents each year, and in an order so that
# they correspond to the sums of emissions for that year in sumVec.
# TODO:: make prettier!!!
png("plot1.png", 480, 480)
plot(c(1999, 2002, 2005, 2008),sumVec, xlab="Year"
     , ylab="Emission Sums (Tons)", main="PM2.5 Emissions Sums by Year")
dev.off()