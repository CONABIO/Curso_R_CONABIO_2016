# cargamos el paquete
library(tidyr) 
library(plyr)
library(dplyr)

# leemos la base
pew <- read.delim(file = "http://stat405.had.co.nz/data/pew.txt",
  header = TRUE, stringsAsFactors = FALSE, check.names = F)
View(pew)

pew_tidy<-gather(data= pew, key=ingreso, value=freq, -religion)
View(pew_tidy)

### Muchos datos en una columna
tb <- read.csv("practica/tidyr/tb.csv")
View(tb)

tb2<-gather(data=tb, key=demografia, value=freq, -id, -iso2, -year, 
           na.rm=TRUE)

tb4<-separate(tb2, col=demografia, into=c("basura", "genero", "edad"), sep=c(7,8))
View(tb4)

## Lo mismo con pipe %>%

tb_limpia<-tb %>% 
           gather(key=demografia, value=freq, -id, -iso2, -year, na.rm=TRUE) %>%
           separate(col=demografia, into=c("basura", "genero", "edad"), sep=c(7,8))
View(tb_limpia)

### Otro ejemplo
clima <- read.delim("practica/tidyr/clima.txt", stringsAsFactors=FALSE)  
clima_limpio<-gather(clima, dia, valor, d1:d31, na.rm=TRUE)  %>%
              mutate(dia=extract_numeric(dia), valor=valor/10) %>%
              spread(element, valor)
 




  