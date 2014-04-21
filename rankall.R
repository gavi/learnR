rankall <- function(outcome, num = "best") {
  cols<-c(11,17,23)
  names(cols)<-c("heart attack","heart failure","pneumonia")
  if(is.na(cols[outcome])){
    stop("invalid outcome")
  }
  col<-cols[outcome]
  outcomes<-read.csv("outcome-of-care-measures.csv",colClass="character")
  outcomes[[col]]<-as.numeric(outcomes[[col]])
  #Remove the na's for this outcome
  data<-outcomes[!is.na(outcomes[[col]]),]
  
  #setup index and descending
  
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
  
  #Split by State into a list
  splist<-split(data,data[["State"]])
  data<-lapply(splist,function(x) x[order(x[[col]],x[["Hospital.Name"]],decreasing=dec)[index],c("Hospital.Name","State")])
  output<-data.frame()
  n<-names(data)
  i<-1
  for(state in data){
    state["State"]=n[i]
    output<-rbind(output,state)
    i<-i+1
  }
  colnames(output)<-c("hospital","state")
  output
}

