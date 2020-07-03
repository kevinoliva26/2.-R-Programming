x <- read.csv('./Data/hw1_data.csv')

head(x)

tail(x)

x[47,]

sum(is.na(x$Ozone))

i <- complete.cases(x$Ozone)
mean(x[i,"Ozone"])

y <- x[x$Ozone>31& x$Temp>90,]  
i <- complete.cases(y)
mean(y[i,"Solar.R"])


y <- x[x$Month==6,"Temp"]
mean(y)

y<- x[x$Month==5,"Ozone"]
bad <- is.na(y)
max(y[!bad])
