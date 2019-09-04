library(rvest)
library(httr)
library(jsonlite)

token = 'd522aa97197fd864d36b418f39ebb323'
forma = 'json'
geoco = "-33.45%2C-70.67"
lengu = 'es-CL'
units = 'm'

urlClima <- paste('https://api.weather.com/v2/turbo/vt1dailyForecast?apiKey=',token,'&format=',forma,'&geocode=',geoco,'&language=',lengu,'&units=', units,sep = "")
print(urlClima)

consultaGetNuevas <- GET(url = urlClima,format = 'json')#, query = list(apiKey = token, format = forma, geocode = geoco, language = lengu, units = units))  
contentNuevo <- content(consultaGetNuevas,"text")


jsonNuevo <- jsonlite::fromJSON(contentNuevo)

write_json(jsonNuevo,"todosLosDatos04DeSeptiembre")

