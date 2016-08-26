###### Tidyr

# cargamos paquetes
library(tidyr) 
library(plyr)
library(dplyr)

# leemos las bases ejemplo 

##### Gather
pew <- read.delim(file = "http://stat405.had.co.nz/data/pew.txt",
  header = TRUE, stringsAsFactors = FALSE, check.names = F)
pew

pew_tidy <- gather(data = pew, income, frequency, -religion)
# vemos las primeras líneas de nuestros datos alargados 
head(pew_tidy) 
# y las últimas
tail(pew_tidy)

###### Separate
# base ejemplo
tb <- read.csv("tb.csv")
head(tb)
colnames(tb)

# 1 gather
tb_long <- gather(tb, demo, n, -iso2, -year, -id, na.rm = TRUE)
head(tb_long)

# 2 separate
tb_tidy <- separate(tb_long, demo, c("sex", "age"), 8)
head(tb_tidy)
table(tb_tidy$sex)

##### Mutate y select
# base ejemplo
clima <- read.delim("../Practicas/Uni7/data/clima.txt", stringsAsFactors=FALSE)
head(clima)

# gather
clima_long <- gather(clima, day, value, d1:d31, na.rm = TRUE)
head(clima_long)

# Mutate y select
clima_vars <- clima_long %>% 
  mutate(day = extract_numeric(day), value = value / 10)  %>%
  select(id, year, month, day, element, value) %>%
  arrange(id, year, month, day)
head(clima_vars)

# spread
clima_tidy <- spread(clima_vars, element, value)
head(clima_tidy)




###### Divide aplica combina
# Datos chocolate
df_ej <- data.frame(genero= c("mujer", "hombre", "mujer", "mujer", "hombre"), 
  estatura = c(1.65, 1.80, 1.70, 1.60, 1.67))
df_ej

#### Filtrar

filter(df_ej, genero == "mujer")
filter(df_ej, estatura > 1.65 & estatura < 1.75)

# **Ejercicio:** Encuentra todos los vuelos hacia SFO ó OAK.

flights <- read.csv("flights.csv")
head(flights)

#### Seleccionar
df_ej
select(df_ej, genero)
select(df_ej, -genero)

select(df_ej, starts_with("g"))
select(df_ej, contains("g"))


#### Arreglar (`arrange`)
  
arrange(df_ej, genero)
arrange(df_ej, desc(estatura))

#### Mutar (`mutate`)
# crear nuevas variables (columnas):
mutate(df_ej, estatura_cm = estatura * 100) 
mutate(df_ej, estatura_cm = estatura * 100, estatura_in = estatura_cm * 0.3937) 


#### Summarise y resúmenes por grupo
summarise(df_ej, promedio = mean(estatura))

# Podemos hacer resúmenes por grupo, primero creamos una base de datos agrupada:
by_genero <- group_by(df_ej, genero)
by_genero


# y después operamos sobre cada grupo, creando un resumen a 
# nivel grupo y uniendo
# los subconjuntos en una base nueva:
  
summarise(by_genero, promedio = mean(estatura))
# Algunas funciones útiles con `summarise` son min(x), median(x), max(x), 
# quantile(x, p), n(), sum(x), sum(x > 1), mean(x > 1), sd(x).


flights$date_only <- as.Date(flights$date)
by_date <- group_by(flights, date_only)
no_miss <- filter(by_date, !is.na(dep))
delays <- summarise(no_miss, mean_delay = mean(dep_delay), n = n())


#**Ejercicio** Reescribe el código anterior utilizando %>%
