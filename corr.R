corr<-function(directory,threshold = 0){
  files<-list.files(directory,full=TRUE)
  output<-c()
  for(file in files){
    x<-read.csv(file)
    good<-(!is.na(x[["nitrate"]]))&(!is.na(x[["sulfate"]]))
    numobserved<-sum(good)
    if(numobserved>threshold){
      output=c(output,cor(x[["sulfate"]][good],x[["nitrate"]][good]))
    }
  }
  output
}