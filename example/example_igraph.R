library(igraph)

# Read the edge list file
edge_data <- read.table("./HepPh.csv/edges.csv", sep = ",")

node_data <- read.table("./HepPh.csv/nodes.csv", sep = ",")

# Create a graph object from the edge list data
graph <- graph_from_data_frame(edge_data)

V(graph)$date <- node_data$V3 
V(graph)$name <- node_data$V2

summary(graph)

write_graph(graph, "igraph_test.graphml", format = c("graphml"))
# Create a graph object from the edge list data
#graph <- read.graph("./HepPh.gml",format=c("gml"))


# Plot the graph
layout <- layout_with_kk(graph)
plot(graph, layout = layout, vertex.size = 1)

# Compute the degree centrality of each node
degree <- degree(graph)
print(degree)

# Plot the degree distribution
hist(degree, main="Degree Distribution", xlab="Degree")

library(ggplot2)

degree <- as.data.frame(degree)
ggplot(degree, aes(x = degree)) +
  geom_histogram(binwidth = 0.1, log = TRUE) +
  xlab("Value") +
  ylab("Frequency") +
  scale_x_log10() +
  scale_y_log10() +
  theme_classic()

# Use the infomap algorithm to detect communities
communities <- cluster_infomap(graph)
print(communities)

# Plot the community structure of the network
plot(communities, graph, vertex.size = 1)

#largest connected component
components <- clusters(graph, mode="weak")
biggest_cluster_id <- which.max(components$csize)

# ids
vert_ids <- V(graph)[components$membership == biggest_cluster_id]

# subgraph
subgraph <- induced_subgraph(graph, vert_ids)

# Use the infomap algorithm to detect communities
communities <- cluster_infomap(subgraph)
print(communities)

# Plot the community structure of the network
plot(communities, subgraph, vertex.size = 1)

plot(communities, subgraph,
edge.arrow.size=0.1, 
vertex.shape="circle", 
vertex.size=1, 
vertex.label=NA,
edge.width=0.5)


# Step 6: Network modeling
# Fit a power-law distribution to the degree distribution
power_law <- fit_power_law(degree)
print(power_law)

