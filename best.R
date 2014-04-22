## Find the Best Hospital in a state for a specific outcome
## The best function takes a valid state and outcome and returns the best hospital
## (Lowest mortality rate for that outomce)

best <- function(state, outcome) {
  cols=c(11,17,23)
  #define valid outcomes
  names(cols)<-c("heart attack","heart failure","pneumonia")
  #check input is valid
  if(is.na(cols[outcome])){
    stop("invalid outcome")
  }
  col<-cols[outcome] #col will be the column number for the outcome
  outcomes<-read.csv("outcome-of-care-measures.csv",colClass="character")
  outcomes[[col]]<-as.numeric(outcomes[[col]]) #Disregard warning about NA's being coerced
  state_data=outcomes[outcomes[["State"]]==state & !is.na(outcomes[[col]]),]
  if(nrow(state_data)==0){
    stop("invalid state")
  }
  #break the tie based ont he sort function
  sort(state_data[state_data[[col]]==min(state_data[[col]]),c("Hospital.Name")])[1]
  
}

# Example Output

# > best("TX","heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
# Warning message:
#   In best("TX", "heart attack") : NAs introduced by coercion
# > 