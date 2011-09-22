#skirta postscript failu kepimui#


d2ps <- function(file="Rplot%d.ps",height=6,width=8,which=dev.cur(),...) {
if(which!=dev.cur()) {
cur <- dev.cur()
dev.set(which)
}
else cur <- NULL
6
dev.copy(device=postscript,file=file,height=height,width=width,
horizontal=FALSE,onefile=TRUE,paper="special",...)
dev.off()
if(!is.null(cur))dev.set(cur)
else dev.set(which)
}







