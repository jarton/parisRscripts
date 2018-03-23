p2wshIn <- read.table(file="./data/heightPWSHinputs.csv", header=TRUE, sep=",")
p2wshMsIn <- read.table(file="./data/heightMultisigClosed.csv", header=TRUE, sep=",")

#png(filename="./output/p2wshToMS.png", height=595, width=600, bg="white")

addTotalCol <- function(dataframe){
	totalvector <- c()
	totalcount <- 0

	for (i in 1:length(dataframe[,1])) { 
		totalcount <- totalcount + dataframe[i,2]
		totalvector[i] <- totalcount
	}
	return(cbind(dataframe, totalvector))
}

calcpercentVect <- function(dataframe1, dataframe2) {
	percentchange <- c()

	for (i in 1:length(dataframe1[,1])) { 
		percentchange[i]  <- (dataframe1[i,3] / dataframe2[i,3]) * 100
	}
	return(cbind(dataframe1[,1], percentchange))
}

p2wshIn  <- addTotalCol(p2wshIn)
p2wshMsIn  <- addTotalCol(p2wshMsIn)

msPercentOfp2wsh  <- calcpercentVect(p2wshMsIn, p2wshIn)

# Trim off excess margin space (bottom, left, top, right)
par(mar=c(4.2, 3.8, 0.2, 0.2))
# create blot
plot(x=msPercentOfp2wsh[,1], y=msPercentOfp2wsh[,2], xlab="BlockHeight", ylab="2of2 multisig percent of total p2wsh inputs", col='blue', type="l", ylim=c(0,100))
q
box()
## Restore default margins
par(mar=c(5, 4, 4, 2) + 0.1)

#dev.off()
