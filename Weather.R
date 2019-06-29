#install.packages("rvest")
library(rvest)

htmlWeather <- "https://weather.com/es-CL/tiempo/mensual/l/cb0b09b804fbcfb93b3485607c771c23607ce00484606431defb3c0cd10efb79"
paginaWeather <- read_html(htmlWeather)

#teniendo la informacion realizamos la extraccion 
nodesDelHTMLWeatherDia <- html_nodes(paginaWeather,".date")

#solo trabajamos con el texto
dia <- html_text(nodesDelHTMLWeatherDia)
#--------------------------------------------------------------------

#teniendo la informacion realizamos la extraccion 
nodesDelHTMLWeatherTemperaturaAlta <- html_nodes(paginaWeather,".temps")

#trabajamos con la temperatura
temperatura <- html_text(nodesDelHTMLWeatherTemperaturaAlta)

#eliminamos los "°" de lo numeros 
temperaturaLimpia <- gsub("°",";",temperatura)

#creamos la tabla 
tablaDatos <- data.frame(dias = dia, temperaturas = temperaturaLimpia)

#####################################################################################
#--------------------------ERROR------------------------------------------------
#################################################################################
#intentamos separar la temperatura en dos columnas una mayor temp y una menor temp.
library(stringr)
str_split_fixed(tablaDatos$temperaturas,";")
##################################################################################
###############################################################################

#guardo los datos
write.table(tablaDatos, file="tabla29dejunio.csv", sep = ";")
