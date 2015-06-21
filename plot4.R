setwd("~/R/RWorkingDir/ExploratoryDataAnalysisCourse/Proj2/")
source("proj2.R")

# Coal combustion codes : we subset the code file's SCC variable based on the
# EI.Sector having the word coal in it, indicating that coal was the form of
# fuel used. This gives us the set of codes that correspond to Coal combustion.
coalCombCode <- dataCode$SCC[grep("[Cc]oal", as.character(dataCode$EI.Sector))]

# retrieve data where the SCC code is contained with coalCombCode
coalCombData <- emisData[emisData$SCC %in% coalCombCode,]
sumVec <- c(sum(coalCombData$Emissions[coalCombData$year==1999])
            , sum(coalCombData$Emissions[coalCombData$year==2002])
            , sum(coalCombData$Emissions[coalCombData$year==2005])
            , sum(coalCombData$Emissions[coalCombData$year==2008]))
png("plot4.png", 480, 480)
years <- c(1999, 2002, 2005, 2008)
plot(years, sumVec, xlab="Year", ylab="Emissions Sums (Tons)"
     , main="PM2.5 Emissions Produced By Coal Combustion in US")
dev.off()