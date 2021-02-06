
### Read in Yahoo Finance
Read_Yahoo_Data <- function(start = as.Date('01-01-2020'), 
                            end = Sys.Date(), ticker){
  ## Function to read in data from yahoo finance
  
  ## Bring in data from yahoo finance, from the start to the end date
  df <- getSymbols(ticker, 
                   src = 'yahoo',
                   auto.assign = F, 
                   from = start, 
                   to = end) 
  
  
  ## Add in the date column
  dates <- index(df) 
  df <- as_tibble(df) 
  df$date <- dates
  
  ## Rename all the columns 
  names(df) <- c('open', 'high', 'low', 'close', 'volume', 'adjusted', 'date') 
  
  
  
  ## We really only need the adjusted close and the date column
  return(df[,c('date', 'adjusted')]) 
  
}


library(quantmod) 
library(tidyverse) 
fred <- getSymbols('DGS3MO', src = 'FRED', auto.assign = F, from = as.Date('01-01-2020'), 
                   to = Sys.Date())  

head(fred) 
