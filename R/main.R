#Funkciju nuskaitymas#
#---------------------------------------------------------------------#

source("C:/Documents and Settings/Povilas/Desktop/kursinis darbas/R/funkcijos.R")
Sys.setlocale(locale="lithuanian")


#---------------------------------------------------------------------#


#Susitvarkymas su duomenimis#
#---------------------------------------------------------------------#

data=read.csv2('C:/Documents and Settings/Povilas/Desktop/kursinis darbas/Data/data.txt')
data=ts(data,freq=4,start=2000)

wage=data[,'wage']
e=data[,'e']
plf=data[,'plf']
p=data[,'p']
gdp=data[,'gdp']

#---------------------------------------------------------------------#

#Duomenu statistikos#
#---------------------------------------------------------------------#

s.wage=c(mean(wage),min(wage),max(wage))
names(s.wage)=c('Vidurkis','Minimumas','Maksimumas')

s.e=c(mean(e),min(e),max(e))
names(s.e)=c('Vidurkis','Minimumas','Maksimumas')

s.plf=c(mean(plf),min(plf),max(plf))
names(s.plf)=c('Vidurkis','Minimumas','Maksimumas')

s.p=c(mean(p),min(p),max(p))
names(s.p)=c('Vidurkis','Minimumas','Maksimumas')

s.gdp=c(mean(gdp),min(gdp),max(gdp))
names(s.gdp)=c('Vidurkis','Minimumas','Maksimumas')

#---------------------------------------------------------------------#

#Duomenu grafikai
#---------------------------------------------------------------------#

#plot(wage, main='Darbo uþmokestis 2000-2008',xlab='Metai',ylab='Atlyginimas (LT)')
#plot(e, main='Dirbantys gyventojai 2000-2008',xlab='Metai',ylab='Dirbantieji (Tukst.)')
#plot(plf, main='Darbingi gyventojai 2000-2008',xlab='Metai',ylab='Darbingi Gyventojai (Tukst.)')
#plot(p, main='Kainu lygis 2000-2008',xlab='Metai',ylab='Kainu lygis (Indeksas)')
#plot(gdp, main='Bendras vidaus produktas 2000-2008',xlab='Metai',ylab='BVP (Mljn.)')





#postscript(file="test.ps")
#plot(rnorm(100))
#dev.off()

#postscript(file="ssplot.ps",horizontal=FALSE,onefile=TRUE,paper="special",width=4,height=3)
#par(mar=c(4,4,2,2),cex=0.6)



#plot(rnorm(100),main="Simple scatter plot",pch=1)
#d2ps(file="ssplot.ps",width=3,height=3*3/4)

#Lietuviskom raidem
#postscript(file="sslt.ps",enc="ISOLatin7",family="URWHelvetica",horizontal=FALSE, onefile=TRUE,paper="special",width=3,height=3*3/4))