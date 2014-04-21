complete <- function(directory, id = 1:332) {
  files<-sprintf("%s/%.3d.csv",directory,id)
  output<-NULL
  for(file in files){
    pdata<-read.csv(file)
    tmp<-data.frame(id=pdata[["ID"]][1],nobs=sum((!is.na(pdata[["sulfate"]]))&(!is.na(pdata[["nitrate"]]))))
    output<-rbind(output,tmp)
  }
  output
}