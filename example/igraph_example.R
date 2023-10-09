library(igraph)


graph <- read.graph("ahmedabad.gml", format = "gml")

plot(graph, layout = layout_with_fr(graph), vertex.size = 1, vertex.label = NA)

degree_dist <- degree_distribution(graph)

hist(degree_dist, main = "Degree Distribution", xlab = "Degree", ylab = "Frequency", col = "blue", breaks = 30)
