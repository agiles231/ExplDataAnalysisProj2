setwd("~/R/RWorkingDir/ExploratoryDataAnalysisCourse/Proj2/")
source("proj2.R")
baltArea <- emisData[emisData$fips=="24510",]
sumVec <- c(sum(baltArea[baltArea$year==1999 &
                           baltArea$type=="POINT", 4])
            , sum(baltArea[baltArea$year==1999 &
                             baltArea$type=="NONPOINT", 4])
            , sum(baltArea[baltArea$year==1999 &
                             baltArea$type=="ON-ROAD", 4])
            , sum(baltArea[baltArea$year==1999 &
                             baltArea$type=="NON-ROAD", 4])
            , sum(baltArea[baltArea$year==2002 &
                             baltArea$type=="POINT", 4])
            , sum(baltArea[baltArea$year==2002 &
                             baltArea$type=="NONPOINT", 4])
            , sum(baltArea[baltArea$year==2002 &
                             baltArea$type=="ON-ROAD", 4])
            , sum(baltArea[baltArea$year==2002 &
                             baltArea$type=="NON-ROAD", 4])
            , sum(baltArea[baltArea$year==2002 &
                             baltArea$type=="POINT", 4])
            , sum(baltArea[baltArea$year==2005 &
                             baltArea$type=="NONPOINT", 4])
            , sum(baltArea[baltArea$year==2005 &
                             baltArea$type=="ON-ROAD", 4])
            , sum(baltArea[baltArea$year==2005 &
                             baltArea$type=="NON-ROAD", 4])
            , sum(baltArea[baltArea$year==2008 &
                             baltArea$type=="POINT", 4])
            , sum(baltArea[baltArea$year==2008 &
                             baltArea$type=="NONPOINT", 4])
            , sum(baltArea[baltArea$year==2008 &
                             baltArea$type=="ON-ROAD", 4])
            , sum(baltArea[baltArea$year==2008 &
                             baltArea$type=="NON-ROAD", 4]))
year <- c(1999, 1999, 1999, 1999, 2002, 2002, 2002, 2002, 2005, 2005, 2005
          , 2005, 2008, 2008, 2008, 2008)
type <- c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD")
type <- c(type, type, type, type)
baltArea$year <- year
baltArea$Emissions <- sumVec
baltArea$type <- type
p <- qplot(year, Emissions, data=baltArea, xlab="Year"
      , ylab="PM2.5 Emissions per Year (Tons)"
      , main = "PM2.5 Emissions in Baltimore Area by Type"
      , facets = .~type, geom = c("point", "smooth"))
ggsave(filename = "plot3.png", plot = p)