pollutantmean <- function(directory, pollutant, id = 1:332){
  means <- c()
  for(x in id){
    path <- paste(getwd(), "/Data/",directory,"/",sprintf("%03d",x),".csv",sep = "")
    data <- read.csv(path)
    datamean <- data[pollutant]
    means <- c(means, datamean[!is.na(datamean)])
  }
  mean(means)
}

complete <- function(directory, id = 1:332){
  results <- data.frame(id=numeric(0), nobs=numeric(0))
  for(x in id){
    path <- paste(getwd(), "/Data/", directory, "/", sprintf("%03d", x), ".csv", sep = "")
    data <- read.csv(path)
    nobsdata <- data[(!is.na(data$sulfate)), ]
    nobs <- nrow(nobsdata)
    results <- rbind(results, data.frame(id=x, nobs=nobs))
  }
  results
}

corr <- function(directory, threshold = 0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the 
  ## number of completely observed observations (on all
  ## variables) requi?red to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  cor_results <- numeric(0)
  
  complete_cases <- complete(directory)
  complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
  #print(complete_cases["id"])
  #print(unlist(complete_cases["id"]))
  #print(complete_cases$id)
  
  if(nrow(complete_cases)>0){
    for(monitor in complete_cases$id){
      path <- paste(getwd(), "/Data/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
      #print(path)
      monitor_data <- read.csv(path)
      #print(monitor_data)
      interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
      interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
      sulfate_data <- interested_data["sulfate"]
      nitrate_data <- interested_data["nitrate"]
      cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
    }
  }
  cor_results
}


