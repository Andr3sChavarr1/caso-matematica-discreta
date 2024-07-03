#Instalar Paquete Haversine
install.packages("geosphere", type = "source")

# Cargar la librerías
library(geosphere)

# Coordenadas de los satélites
STARLINK3999 <- c(4.4, 70.7)  # Nota: la longitud viene primero, luego la latitud
satelite_Destino <- c(11.9, 75) # Nota: la longitud viene primero, luego la latitud

# Calcular la distancia Haversine entre los dos satélites
distancia <- distHaversine(STARLINK3999, satelite_Destino)

# Mostrar la distancia en metros
distancia

# Convertir la distancia a kilómetros
distancia_km <- distancia / 1000



# Mostrar un mensaje con la distancia en kilómetros
message <- sprintf("La distancia entre los satélites es de %.2f km", distancia_km)
print(message)

# Distancia
distancia_km <- 537.34            #Ingresar la Distancia

#Velocidad de la Luz
velocidad <- 299792458

# Calcular la latencia en segundos
latency_segundos <- distancia_km / velocidad

# Convertir la latencia a milisegundos
latency_milisegundos <- latency_segundos * 1000

# Mostrar un mensaje con la distancia en kilómetros y la latencia en milisegundos
message <- sprintf("La latencia es de %.10f ms", latency_milisegundos)
print(message)



