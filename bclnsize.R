p2wshOut <- read.csv(file="./data/heightPWSHoutputs.csv", header=TRUE, sep=",")
p2wshIn <- read.table(file="./data/heightPWSHinputs.csv", header=TRUE, sep=",")


addTotalCol <- function(dataframe){
	totalvector <- c()
	totalcount <- 0

	for (i in 1:length(dataframe[,1])) { 
		totalcount <- totalcount + dataframe[i,2]
		totalvector[i] <- totalcount
	}
	return(cbind(dataframe, totalvector))
}

removeForEach <- function(mainvect, subvect) {
	for (i in 1:length(mainvect[,1])) { 
		mainvect[i,2] <- mainvect[i,2] - subvect[i,2]
	}
	return(mainvect)	
}

png(filename="./output/bclnsize.png", height=595, width=600, 
 bg="white")

# subtract transaction count equal to the number found not to be multisig
p2wshOut <- removeForEach(p2wshOut, p2wshMsIn)
# subtanct transaction count equal to number found to be closing mutlisig
# gives us the total unclosed p2wsh count for each block
totalNotClosed <- removeForEach(p2wshOut, p2wshMsIn)

# count total open p2wsh transaction for each block
totalNotClosed <- addTotalCol(totalNotClosed)

# Trim off excess margin space (bottom, left, top, right)
par(mar=c(4.2, 3.8, 0.2, 0.2))
# create blot
plot(x=totalNotClosed[,1], y=totalNotClosed[,3], xlab="BlockHeight", ylab="Unspent P2WSH outputs", col='blue', type="l")
#
box()
## Restore default margins
par(mar=c(5, 4, 4, 2) + 0.1)

dev.off()
