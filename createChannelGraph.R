library(igraph)

channelArray <- read.csv(file="./data/channelGraph.csv", header=TRUE, sep=",", row.names=1)



links <- as.matrix(channelArray)

g1  <- graph_from_adjacency_matrix(links)

deg <- degree(g1, mode="all")

dev.new(width=10, height=8)

#small graph all nodes
#plot(g1, vertex.size=10, vertex.label.cex=0.5, vertex.label.color="black", edge.arrow.mode=0, edge.label.family="Helvetica", edge.with=1.2, edge.color="blue")

#small graph delete nodes degree0 
#plot(delete.vertices(g1, deg==0), vertex.label=NA, edge.arrow.mode=0, edge.with=1, vertex.size=5)

#big graph delete nodes degree0 
#plot(delete.vertices(g1, deg==0), vertex.label=NA, edge.arrow.mode=0, edge.with=0.5, vertex.size=deg*1.05)

#big graph all nodes
#plot(g1, vertex.label=NA, edge.arrow.mode=0, edge.with=0.5, vertex.size=deg*1.05)
