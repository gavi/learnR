rankhospital<-function(state,outcome,num="best"){
  cols<-c(11,17,23)
  names(cols)<-c("heart attack","heart failure","pneumonia")
  if(is.na(cols[outcome])){
    stop("invalid outcome")
  }
  col<-cols[outcome]
  outcomes<-read.csv("outcome-of-care-measures.csv",colClass="character")
  outcomes[[col]]<-as.numeric(outcomes[[col]])
  state_data<-outcomes[outcomes[["State"]]==state & !is.na(outcomes[[col]]),]
  if(nrow(state_data)==0){
    stop("invalid state")
  }
  
  index<-1
  dec<-F
  if(is.character(num)){
    if(num=="best"){
      index<-1
      
    }
    else if(num=="worst"){
      index<-1
      dec<-T
    }
    else{
     stop("invalid num") 
    }
  }
  else{
    index<-num
  }
  
  state_data[order(state_data[[col]],state_data[["Hospital.Name"]],decreasing=dec)[index],"Hospital.Name"]
  
  
}