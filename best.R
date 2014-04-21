best <- function(state, outcome) {
  cols=c(11,17,23)
  names(cols)<-c("heart attack","heart failure","pneumonia")
  if(is.na(cols[outcome])){
    stop("invalid outcome")
  }
  col<-cols[outcome]
  outcomes<-read.csv("outcome-of-care-measures.csv",colClass="character")
  outcomes[[col]]<-as.numeric(outcomes[[col]])
  state_data=outcomes[outcomes[["State"]]==state & !is.na(outcomes[[col]]),]
  if(nrow(state_data)==0){
    stop("invalid state")
  }
  sort(state_data[state_data[[col]]==min(state_data[[col]]),c("Hospital.Name")])[1]
  
}

