#Descargar data y extraerla en el wd()
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

#Enlistar los archivos del directorio
list.files("diet_data")

#leer un archivo
andy <- read.csv("diet_data/Andy.csv")
head(andy)

#algunas funciones utiles para explorar la data
length(andy$Day)
dim(andy)
str(andy)
summary(andy)
names(andy)

#Peso de Andy primer, medio y ultimodia
andy[c(1,15,30), "Weight"]

#Otra manera de hacer el subset
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]
subset(andy$Weight, andy$Day==30)

#asignando valores
andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]
andy_loss <- andy_start - andy_end
andy_loss

#guardando los archivos en una lista que luego seran leidos  
files <- list.files("diet_data")
files
files[1]
files[3:5]

#Revisando el archivo de John da un error porque falta el directorio donde estan los archivos
head(read.csv(files[3]))

#Se puede usar dentro de list.files() el argumento de full.names=TRUE 
files_full <- list.files("diet_data", full.names=TRUE)
files_full
head(read.csv(files_full[3]))

#Para juntar el data set se hace un rbin
andy_david <- rbind(andy, read.csv(files_full[2]))
head(andy_david)
tail(andy_david)

#Subset del dia 25
day_25 <- andy_david[which(andy_david$Day == 25), ]
day_25
andy_david[(andy_david$Day==25),]

#Leyendo todos los csv y consolidandolos en 1
dat <- data.frame()
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)
levels(dat$Patient.Name)

#Para saber la mediana del peso
median(dat$Weight, na.rm=TRUE)

#Saber la mediana del dia 30
dat_30 <- dat[which(dat[, "Day"] == 30),]
dat_30
median(dat_30$Weight)
median(dat[which(dat[, "Day"] == 30),]$Weight)

#Formula para calular la mediana dado un dia
weightmedian <- function(directory,day){
  dat <- data.frame()
  files_full <- list.files(directory, full.names=TRUE)
  for (i in 1:5){
        dat <- rbind(dat, read.csv(files_full[i]))
        dat_median <- median(dat[which(dat[, "Day"] == day),]$Weight,na.rm = TRUE)
  }
  dat_median
}


#Otra manera de cargar csv mas optima
summary(files_full)
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)

#leyendo los archivos y agregandolos a tmp
for (i in seq_along(files_full)) {
  tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)

#Se puede hacer lo mismo utilizando lapply
str(lapply(files_full, read.csv))

str(tmp[[1]])
head(tmp[[1]][,"Day"])

#Para pasar estas listas a un data frame se usa do.call()
#lets you specify a function and then passes a list as if each element of the list were an argument to the function
#The syntax is `do.call(function_you_want_to_use, list_of_arguments)
output <- do.call(rbind, tmp)
str(output)

