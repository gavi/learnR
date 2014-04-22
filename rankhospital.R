## Hospital Ranking
## The rankHospital function takes a state,outcome and num and returns the hospital with that rank in that state
## outcomes could be one of these ("heart attack","heart failure","pneumonia")
## state should be a valid state in the data set
## num could be numeric rank or strings ("worst","best").


rankhospital<-function(state,outcome,num="best"){
  #numeric columns where our data is stored
  cols<-c(11,17,23)
  #Create a dictionary like structure to validate the input
  names(cols)<-c("heart attack","heart failure","pneumonia")
  if(is.na(cols[outcome])){
    stop("invalid outcome")
  }
  #Get the numeric column index
  col<-cols[outcome]
  #Read the file
  outcomes<-read.csv("outcome-of-care-measures.csv",colClass="character")
  outcomes[[col]]<-as.numeric(outcomes[[col]]) #Convert our column to numeric - You might get a warning - ignore
  #Extract only the state data and remove NA's
  state_data<-outcomes[outcomes[["State"]]==state & !is.na(outcomes[[col]]),]
  #If number of rows is 0 show an error about invalid state
  if(nrow(state_data)==0){
    stop("invalid state")
  }
  #Find out the rank that we need to extract
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
  #Finally get the order and extract it from state data
  state_data[order(state_data[[col]],state_data[["Hospital.Name"]],decreasing=dec)[index],"Hospital.Name"]
  
  
}