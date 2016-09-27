
### leer base

x<-read.table("Cultivos_de_Tu_Municipio_2015SAGARPA.csv", header=TRUE, sep=",")
View(x)

### vamos a ver un structure
str(x)

# ¿Qué pasa si intentamos sacar la media de un factor?
mean(x$VALOR.DE.LA.PRODUCCI.N..pesos.)

## Convertir un factor (texto) a números

#Ejemplo chiquito
y<-head(x$VALOR.DE.LA.PRODUCCI.N..pesos.)
y<-gsub("," , "", y)
y<-as.numeric(y)
mean(y)

# Ejercicio: transformar TODA la columna
# SUPERFICE.COSECHADA..ha. a numerico

#ejemplo 1
z<-gsub(",", "", x$SUPERFICE.COSECHADA..ha.)
z<-as.numeric(z)
mean(z)

#ejemplo 2: regresandolo a la tabla original
z<-x$SUPERFICE.COSECHADA..ha.
z<-gsub(",", "", z)
z<-as.numeric(z)

# dejar nombre sustituir contenido
x$SUPERFICE.COSECHADA..ha.<-z

# agregar nueva col 
x$SupCoseHa<-z

