#Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:
library(datasets)
data(iris)

tapply(iris$Sepal.Length, iris$Species, mean)

#Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
apply(iris[,1:4],2,mean)
#2 porque se quedan las columnas

#Tambien se pudo haber hecho asi:
colMeans(iris[,1:4])

#How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.
data("mtcars")
?mtcars
#Opcion 1
tapply(mtcars$mpg, mtcars$cyl,mean)

#Opcion 2
sapply(split(mtcars$mpg,mtcars$cyl),mean)

#Opcion 3
with(mtcars, tapply(mpg,cyl,mean))

#Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
hp_per_cyl <- tapply(mtcars$hp, mtcars$cyl,mean)
hp4cyl <- hp_per_cyl["4"]
hp8cyl <- hp_per_cyl["8"]
hp4cyl - hp8cyl


