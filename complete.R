## Pollution complete sets finder
## The complete function takes a directory of CSV pollutantion files and prints out number of
## complete observations

complete <- function(directory, id = 1:332) {
  files<-sprintf("%s/%03d.csv",directory,id)
  output<-NULL
  for(file in files){
    pdata<-read.csv(file)
    tmp<-data.frame(id=pdata[["ID"]][1],nobs=sum((!is.na(pdata[["sulfate"]]))&(!is.na(pdata[["nitrate"]]))))
    output<-rbind(output,tmp)
  }
  output
}

# Example output
# > complete("specdata",1:10)
#    id nobs
# 1   1  117
# 2   2 1041
# 3   3  243
# 4   4  474
# 5   5  402
# 6   6  228
# 7   7  442
# 8   8  192
# 9   9  275
# 10 10  148
# > 