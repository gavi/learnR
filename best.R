best<-function(state,outcome){
  cols<-c(11,17,23)
  names(cols)<-c("heart attack","heart failure","pneumonia")
  if(is.na(cols[outcome])){
    stop("invalid outcome")
  }
  coltoprocess<-cols[outcome]
  data<-read.csv("outcome-of-care-measures.csv",colClasses="character")
  data[,coltoprocess]<-as.numeric(data[,coltoprocess])
  state_data<-data[data[["State"]]==state&!is.na(data[[coltoprocess]]),]
  if(nrow(state_data)==0){
    stop("invalid state")
  }
  print(state_data[state_data[[coltoprocess]]==min(state_data[[coltoprocess]]),2])
}
