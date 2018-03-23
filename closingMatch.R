#library(pracma)

lndClosing <- read.csv(file="./data/closeList.csv", header=TRUE, sep=",")
bcClosing <- read.table(file="./data/closingListBC.csv", header=TRUE, sep=",")

found  <- 0
outpointSame  <- 0

for (i in 1:length(lndClosing[,1])) { 
	for (j in 1:length(bcClosing[,1])) { 
		if (lndClosing[i,1] == bcClosing[j,1]) {
			found  <- found + 1
			#if (strcmp(toString(lndClosing[i,2]), toString(bcClosing[j,2]))) {
			if (toString(lndClosing[i,2]) == toString(bcClosing[j,2])) {
				outpointSame <- outpointSame + 1
			}
		}
	}
}

print(found)
print(outpointSame)
print(length(bcClosing[,1]))
print(length(lndClosing[,1]))

# #png(filename="./output/closingFound.png", height=595, width=600, 
# 	bg="white")
# 
# ## Trim off excess margin space (bottom, left, top, right)
# par(mar=c(4.2, 3.8, 0.2, 0.2))
# 
# ## create plot
# plot(x=length(lndClosing), y=found, xlab="BlockHeight", ylab="Unspent P2WSH outputs", col='blue', type="l")
# ##
# box()
# ### Restore default margins
# par(mar=c(5, 4, 4, 2) + 0.1)
# #
# #dev.off()
