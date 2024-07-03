install.packages("igraph")
library(igraph)

# Insertamos los datos (vertices y aristaas)
mapa_satelital <- data.frame(
  from = c("STARLINK-5002", "STARLINK-5002", "STARLINK-5828", "STARLINK-5828", "STARLINK-1626", "STARLINK-3940", "STARLINK-3940", 
           "STARLINK-1922", "STARLINK-1922", "STARLINK-1922", "STARLINK-4524", "STARLINK-1582", "STARLINK-1582", "STARLINK-31013"),
  to = c("STARLINK-1626", "STARLINK-30247", "STARLINK-1626", "STARLINK-3940", "STARLINK-3940", "STARLINK-30247", "STARLINK-1922", 
         "STARLINK-30247", "STARLINK-4524", "STARLINK-31013", "STARLINK-1582", "STARLINK-3084", "STARLINK-31013", "STARLINK-3084"),
  latencia = c(0.0017902051, 0.0016338637, 0.0011896230, 0.0004827340, 0.0007076896, 0.0008913500, 0.0008186664, 0.0004306980, 0.0004101171, 0.0014281880, 
               0.0013820228, 0.0003745258, 0.0003965410, 0.0007666304)
)

#Creamos el Grafo
grafo_satelites <- graph_from_data_frame(mapa_satelital, directed = FALSE)  
#graph_from_data_frame sirve para crear un grafo a partir de un marco de datos (data frame).

# Graficar el grafo 
plot(grafo_satelites, vertex.size = 15, vertex.label.cex = 1, main = "Grafo de Satélites")

# Graficar el grafo con las etiquetas de los pesos de las aristas
plot(grafo_satelites, edge.label = E(grafo_satelites)$latencia, vertex.size = 15, 
     vertex.label.cex = 0.8, edge.label.cex = 1, main = "Grafo de Satélites con Latencias")

#Grafo camino mas corto con algoritmo de Dijkstra

#Determinamos el Nodo Origen y Nodo Destino
nodo_fuente <- "STARLINK-5002"
nodo_destino <- "STARLINK-3084"

#Determinamos el camino mas corto con el algoritmo de Dijkstra
camino_mas_corto <- shortest_paths(grafo_satelites, from = nodo_fuente, to = nodo_destino, weights = E(grafo_satelites)$latencia)
vertices_camino <- camino_mas_corto$vpath[[1]]
nombres_camino <- V(grafo_satelites)[vertices_camino]$name
print(nombres_camino)

# Resaltamos los nodos y las aristas en el camino más corto
colores_nodos <- rep("skyblue", vcount(grafo_satelites))
colores_nodos[vertices_camino] <- "red"

# Resaltamos las aristas en el camino más corto

camino_aristas <- E(grafo_satelites, path = nombres_camino)
colores_aristas <- rep("grey", ecount(grafo_satelites))
colores_aristas[camino_aristas] <- "red"

# Graficar el grafo con las etiquetas de los pesos de las aristas y los nodos resaltados
plot(grafo_satelites, 
     edge.label = E(grafo_satelites)$latencia, 
     vertex.size = 15, 
     vertex.label.cex = 0.8, 
     edge.label.cex = 0.9, 
     main = "Grafo de Satélites con Camino Más Corto considerando la latencia",
     vertex.color = colores_nodos,
     edge.color = colores_aristas)

