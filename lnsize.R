lnsize <- read.csv(file="./data/channelCount.csv", header=TRUE, sep=",")

png(filename="./output/lnsize.png", height=595, width=600, 
 bg="white")


# Trim off excess margin space (bottom, left, top, right)
par(mar=c(4.2, 3.8, 0.2, 0.2))
# create blot
plot(x=lnsize[,1], y=lnsize[,2], xlab="BlockHeight", ylab="Advertised channels trough LND", col='blue', type="l")
#
box()
## Restore default margins
par(mar=c(5, 4, 4, 2) + 0.1)

dev.off()
