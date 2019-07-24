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
#library(stringr)
#str_split_fixed(tablaDatos$temperaturas,";")
##################################################################################
###############################################################################

#guardo los datos
write.table(tablaDatos, file="tablajulio22.csv", sep = ";")

#################################################################################

# a la tabla que importamos le pegamos el mes
tablajulio16$dias <- paste(tablajulio16$dias,"julio")

#separamos
variable <- strsplit(tablajulio16$temperaturas,split = "\;")

#cremos lista vacia
lista <- list()

#optenemos el promedio 
for(datos in tablajulio16$temperaturas){
  datos01 <- (unlist(strsplit(datos,";")))
  datos02 <- as.numeric(datos01)
  lista <- unlist(c(lista,mean(datos02)))
  
}
#juntamos la tabla con la lista de promedios 
tablaLimpia16 <- data.frame(tablajulio16,lista)

#guardamos
#guardo los datos
write.table(tablaLimpia16, file="tablaLimpia16.csv", sep = ";")

##############################################################################
############################### graficos#####################################
#############################################################################


library('ggplot2')
#

####################################################################
#
#as.Date(tablaTotal1.2$X14.de.julio, "%d%b%Y")

############################################################################
###########################14 de julio#####################################
##########################################################################

#realizamos el grafico de dispercion 

plot(tablaTotal1.2$fecha, tablaTotal1.2$X14.de.julio,
     main = '14 de julio', xlab = 'Fecha', ylab = 'temp promedio' )


#estadistica descriptiva de los datos a estudiar 

summary(tablaTotal1.2$X14.de.julio[-13:-14])

desviacionEstandar14 <- sd(tablaTotal1.2$X14.de.julio[-13:-14])

##############################################################################
###########################15 de julio ################################
############################################################################

#realizamos el grafico de dispercion 

plot(tablaTotal1.2$fecha, tablaTotal1.2$X15.de.julio,
     main = '15 de julio', xlab = 'Fecha', ylab = 'temp promedio' )


#estadistica descriptiva de los datos a estudiar 

summary(tablaTotal1.2$X15.de.julio[-13:-14])

desviacionEstandar15 <- sd(tablaTotal1.2$X15.de.julio[-13:-14])

############################################################################
########################   16 de julio    #######################################
############################################################################

#realizamos el grafico de dispercion 

plot(tablaTotal1.2$fecha, tablaTotal1.2$X16.de.julio,
     main = '16 de julio', xlab = 'Fecha', ylab = 'temp promedio' )


#estadistica descriptiva de los datos a estudiar 

summary(tablaTotal1.2$X16.de.julio[-14])
datos <- tablaTotal1.2$X16.de.julio[-14] 
datos <- datos[-1]
desviacionEstandar16 <- sd(datos)
summary(datos)
