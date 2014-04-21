pollutantmean <- function(directory, pollutant, id = 1:332) {
  #How do you read all the files in a directory
  #files<-list.files(directory,pattern="*.csv",full.names=TRUE)
  pdata<-NULL
  files<-sprintf("%s/%.3d.csv",directory,id)
  for(file in files){
    pdata<-rbind(pdata,read.csv(file))
  }
  round(mean(pdata[[pollutant]],na.rm=TRUE),digits=3)
}

