##### Ejercicios con grep y amigos


### Leer base

teodb<-read.delim("meta/BaseMaicesNativos-teocintles.txt")
View(teodb)

levels(teodb$Taxa)

sum(teodb$Taxa=="Zea diploperennis")

### grep

grep("mexicana", teodb$Taxa, ignore.case = TRUE)

length(grep("mexicana", teodb$Taxa, ignore.case = TRUE))

grep("[Mm]exicana", teodb$Taxa)

### grepl
grepl("[Mm]exicana", teodb$Taxa)
sum(grepl("[Mm]exicana", teodb$Taxa))



### Otro ej
gachupines<-c("Mexico", "Mexico", "Mejico", "USA", "USA y Mexico son amiguis")

grep("Me[xj]ico|USA", gachupines)

#### subset
mexi<-teodb[grep("[Mm]exicana", teodb$Taxa), ]
View(mexi)

#### sub gsub

gsub("[Kk][Mm]", "km" , teodb$Localidad)


### Ejercicio:
# * Sustituir Mexicana por mexicana
# * Encontrar todas las líneas que digan
#  "la" o "La" en la columna Localidad. 
# Ojo, no que sea parte de una palabra 
# como en "Tlalpan".

grep("^La", teodb$Localidad, value=T)
grep("\\<[Ll]a\\>", teodb$Localidad, value=TRUE)

# Ejercicios con patos

eg<-c("pato", "paaaato", "el pato", "paton", "pto")
grep("pato", eg) 
grep("pato", eg, value=TRUE) 

grep("\\<pato\\>", eg, value=TRUE)

# ¿Cómo hacer que sí encuentre paaaato y los otro pato?
grep("\\<pato\\>", eg, value=TRUE)

grep("\\<pa*to\\>", eg, value=TRUE)
grep("\\<pa+to\\>", eg, value=TRUE)

# enredarlo más: encontrar los patos (no patón ni pto)
eg<-c("pato", "paaaato", "el pato", "paton", "pto", "Pat0")














