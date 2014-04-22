## Calculates the pollutant mean by reading the CSV files in 'specdata' folder
## Pass the spec data and any vector with in the 1:332 range
## Does not check for valid input

pollutantmean <- function(directory, pollutant, id = 1:332) {
  #You can read all the files in a directory by using list.files as below
  #files<-list.files(directory,pattern="*.csv",full.names=TRUE)
  pdata<-NULL
  
  #I chose to construct it using sprintf
  files<-sprintf("%s/%03d.csv",directory,id)
  for(file in files){
    pdata<-rbind(pdata,read.csv(file))
  }
  round(mean(pdata[[pollutant]],na.rm=TRUE),digits=3)
}

# Example output
# > pollutantmean("specdata","sulfate",1:10)
# [1] 4.064
# > pollutantmean("specdata","nitrate",1:10)
# [1] 0.798