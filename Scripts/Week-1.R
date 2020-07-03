#Get working directory
getwd()

#Use dir.create() to create a directory in the current working directory
#Create a file in your working directory using file.create() function.
#Change the name of the file by using file.rename().

#get arguments of a function 
args()

#Matrices
m <- matrix(1:6, nrow = 2, ncol =3)
m
attributes(m)

#Unir matrices
x <- 1:3
y <-10:12
cbind(x,y)
rbind(x,y)
x <- c(1,3, 5) 
y <- c(3, 2, 10)
cbind(x,y)

#Missing Values. devuelve TRUE or FALSE si hay NA o NaN en el vector
#is.na() -> numericos
#is.nan() -> todo lo demas

#Data Frames
#row.names() -> para ve rlos nombres
#read.table() read.csv para leer data
#data.matrix para convertir en una matriz

x<- data.frame(A = 1:4, B = c(T,T,F,F))
x
nrow(x) # Numero de filas
ncol(x) # Numero de columnas

#names(x) para darle nombre a las variables de una vector o lista
#dimnames(x) para darle nombre a una matriz

#Reading tabular data
#read.table(), read.csv
#readlines() <- leer lineas de texto
#source() <- leer codigo de R (inverso de dump)
#dget() <- leer codigo de R (inverso de dput)
#load() <- Leer un workspace

#Writing Data
#write.table
#write.lines
#dump
#dput

#argumentos de read.table
#file
#header
#sep <- como estan separadas las columnas
#skip <- nuimero de lineas para saltar en el comienzo de la tabla
#stringsAsFactors <- si los character variables deben ser factors

#Interfaces al mundo exterior
#file() gzfile() bzfile() url() <- abren conecciones a archivos, gzip, webpages.

#Subsetting. Number operators that can be used to extract subsests of R objects
#[  <- regresa un objeto con la misma clase del original. 
#[[ <- extraer elemetos de una lista o un dataframe
#$  <- para extraer elementos de una listo por nombre. 

#Remover missing values
x <- c(1,2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]
#complete.casses() <- devuelve los elementos que no son NA. Util en NA en varias columnas