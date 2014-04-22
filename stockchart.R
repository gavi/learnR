## Functions to get the raw stock data from Yahoo using csv and plotting using ggplot

stockdata <- function(ticker){
	require(ggplot2);
	url <- paste("http://ichart.finance.yahoo.com/table.csv?s=",ticker,sep="");
	stock_data <- read.csv(url);
	stock_data$Date <- as.Date(stock_data$Date);
	return(stock_data);
}

stockchart <- function(ticker){
	stock_data <- stockdata(ticker);
	output<-qplot(Date,Close,data=stock_data);
	print(output);
	
}
