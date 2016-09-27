##### Ejemplos de limpieza de db
library(tidyr)
library(plyr)


## cargar bases ejemplo
x<-read.delim("meta/maizteocintle_SNP50k_meta_extended.txt")

## Retos:
# 1) Cambiar un factor o valores de una 
# db por otro que puede ser NA
# Símbolos posibles >, <, >=, <=, ==, != 

# ejemplo con números
x[x$Latitud > 20, 15] <- NA

# ejemplo con texto
levels(x$Estado)
levels(x$Estado)[levels(x$Estado) == "Puebla"]<- "PUE" 
levels(x$Estado) 
View(x)


## 2) Seleccionar filas y crear nueva tabla

# En un solo paso
z<-x[c(1:10,(nrow(x)-10):nrow(x)), ]

# Pero agregar info
x2<-x[1:10, ]
x2$EcoRegion<-rep("CielitoLindo", 10)

x3<-x[21:25, ]
x3$EcoRegion<-rep("Guatepeor", 5)
y<-rbind(x2,x3)
View(y)

# Cambiar orden columnas
y2<-y[, c(23, 1:22)]


# Evitar seleccionar una columna
x4<-x[, -1]

#### Seleccionar columnas deseadas con dplyr
library(dplyr)
w<-select(y, contains("Raza"))




