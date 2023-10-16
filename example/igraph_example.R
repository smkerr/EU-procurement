pacman::p_load(
  here, 
  igraph
  )

graph <- read.graph(here("data/network.gml"), format = "gml")

saveRDS(graph, here("data/network.rds"))
graph2 <- readRDS(here("data/network.rds"))

#plot(graph, layout = layout_with_fr(graph), vertex.size = 1, vertex.label = NA)

str(graph)

degree_dist <- degree_distribution(graph)

hist(degree_dist, main = "Degree Distribution", xlab = "Degree", ylab = "Frequency", col = "blue", breaks = 30)

summary(degree_dist)
