m<- matrix( 1:100, ncol=10, byrow=T )
rownames(m)<-1:10
colnames(m)<-1:10
col<- colorRampPalette(c("navy", "white", "firebrick3"))(4)
pheatmap( m, col=col)
pheatmap( m, col=col, breaks=c( 1,10,20,40,100) )
