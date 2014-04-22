## Shows the correlation between nitrate and sulfate for complete observations
## The complete function takes a directory of CSV pollutantion files and prints out correlations between
## sulfate and nitrate provided the observations are above the threshold

#probably should be using the complete function, but re-written anyway

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

#Example Output

# > corr('specdata',600)
#  [1] -0.01895754 -0.15782860  0.25905718  0.72669389  0.05774168  0.46575401  0.55351498 -0.03309130  0.27722096
# [10] -0.14620214  0.19064458 -0.04253357  0.09807386  0.10021247  0.10064350  0.03666592  0.29674410  0.34742157
# [19]  0.23198440  0.27590363  0.00203294  0.08521742  0.01002172 -0.03878593  0.04191777  0.59692914  0.11359659
# [28] -0.01770337  0.13489508  0.17285000  0.28607620  0.33712009  0.42479896  0.36172843 -0.03509034 -0.05300116
# [37]  0.01015829  0.29579370  0.08954710  0.01653564 -0.07449532  0.19014198  0.27352038  0.10955732  0.04621127
# [46] -0.06080823  0.16086505  0.59834333  0.19183481  0.51882017 -0.12317204  0.25397808  0.26878050