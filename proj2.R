library(ggplot2)
setwd("~/R/RWorkingDir/ExploratoryDataAnalysisCourse/Proj2/")
if (!file.exists("pollutionData.zip")) {
  download.file(paste("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%"
                      , "2FNEI_data.zip", sep = "")
                , "pollutionData.zip")
}
# if emisData does not exist or is null, then create and read in the
# emissions data.
if (!exists("emisData") || is.null(emisData)) {
  emisData <- readRDS(unzip("pollutionData.zip", "summarySCC_PM25.rds"))
}
# if dataCode does not exist or is null, then create and read in the
# code data that describes the SCC codes in the emissions data
if (!exists("dataCode") || is.null(dataCode)) {
  dataCode <- readRDS(unzip("pollutionData.zip"
                            , "Source_Classification_Code.rds"))
}
