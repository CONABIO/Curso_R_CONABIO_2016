#### mi script que hace algo

setwd("~/hubiC/Science/Teaching/Mx/R/Curso_R_CONABIO_2016")

# cargar datos
x<-read.csv("practica/tidyr/tb.csv")

# ver datos columna 3
x[,3]

# ver datos columna por nombre
x$new_sp_f4554
x$new_sp_fu

### carac columnas
str(x)

## sacar una media
y<-c(2,3,45,6,2,3)
y
mean(y)

## Sacar la media de una de las columnas 
# de su db
mean(x[,4], na.rm=TRUE)
mean(x$new_sp_m04, na.rm=TRUE)

y<-x$new_sp_m04
mean(y, na.rm=TRUE)

min(y, na.rm=TRUE)
max(y, na.rm=TRUE)
median(y, na.rm=TRUE)
summary(y)
sd(y, na.rm=TRUE)

### Sacar la media de los primeros
# 10 renglones de una columna num
mean(x[1:10,3])

### Sacar la media de los primeros 10
# y los últimos 5 de una columna num.
# en una sola línea
# pista: c()
c(1,2,4,5,10)
c(1:5, 10, 14)
nrow(x)
dim(x)
length(x$year)
tail(x)

mean(x[c(1:10,5765:5769),4], na.rm=TRUE)

mean(x[c(1:10,(nrow(x)-4):nrow(x)),4], na.rm=TRUE)


## Ver cuáles son los valores mayores a
# un valor deseado en una col num

x$year > 2001

tail(x$year)
tail(x$year > 2005)

# quedarse sólo con los datos > a un valor
# deseado en una col num
x$year > 2001
y<- x[x$year > 2001, ]

# quedarse sólo con los datos mayor igual a un valor
# deseado en una col num
x$year >= 2001
y<- x[x$year > 2001, ]

x$year > 2000 & x$iso2 =="AE"



