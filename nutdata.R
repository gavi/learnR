## Takes two nutrients and outputs a scatter plot
## function also checks if the nutrients are valid. Depends on the CSV file nutdata.csv
plotNutrients<-function(nut1,nut2){
  nutdata<-read.csv("nutdata.csv")
  if(! nut1 %in% colnames(nutdata)){
    stop(paste(nut1,"  is not found"))
  }
  if(! nut2 %in% colnames(nutdata)){
    stop(paste(nut2,"  is not found"))
  }
  plot(nutdata[[nut1]],nutdata[[nut2]])
}