#Funkciju nuskaitymas#
#---------------------------------------------------------------------#

source("C:/Users/Stasys/Desktop/Kursinis/kursinis darbas/R/funkcijos.R")
Sys.setlocale(locale="lithuanian")


#---------------------------------------------------------------------#


#Susitvarkymas su duomenimis#
#---------------------------------------------------------------------#

data=read.csv2('C:/Users/Stasys/Desktop/Kursinis/kursinis darbas/Data/data.txt')
data=ts(data,freq=4,start=2000)

wage=data[,'wage']
e=data[,'e']
l=data[,'l']
p=data[,'p']
gdp=data[,'gdp']

#---------------------------------------------------------------------#

#Duomenu statistikos#
#---------------------------------------------------------------------#

s.wage=c(mean(wage),min(wage),max(wage))
names(s.wage)=c('Vidurkis','Minimumas','Maksimumas')

s.e=c(mean(e),min(e),max(e))
names(s.e)=c('Vidurkis','Minimumas','Maksimumas')

s.l=c(mean(l),min(l),max(l))
names(s.l)=c('Vidurkis','Minimumas','Maksimumas')

s.p=c(mean(p),min(p),max(p))
names(s.p)=c('Vidurkis','Minimumas','Maksimumas')

s.gdp=c(mean(gdp),min(gdp),max(gdp))
names(s.gdp)=c('Vidurkis','Minimumas','Maksimumas')

#---------------------------------------------------------------------#

#Duomenu grafikai
#---------------------------------------------------------------------#

#plot(wage, main='Darbo u?mokestis 2000-2008',xlab='Metai',ylab='Atlyginimas (LT)')
#plot(e, main='Dirbantys gyventojai 2000-2008',xlab='Metai',ylab='Dirbantieji (Tukst.)')
#plot(l, main='Darbingi gyventojai 2000-2008',xlab='Metai',ylab='Darbingi Gyventojai (Tukst.)')
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



##
rwage=wage/p * 100
#plot(l)
#plot(decompose(l))
#summary(l)


#plot(p)
#plot(e)
#plot(decompose(e))
#summary(e)
rgdp=gdp/p * 100
#plot(rgdp)
#plot(decompose(rgdp))

#summary(rgdp)


#plot(rgdp)
#mo1=lm(rgdp~g + g^2)
#plot(log(rgdp))



#par(mfrow=c(2,3))
#plot(rwage)
#plot(l)
#plot(e)
#plot(p)
#plot(rgdp)

ldata=log(data)
lwage=ldata[,'wage']
le=ldata[,'e']
ll=ldata[,'l']
lp=ldata[,'p']
lgdp=ldata[,'gdp']

#plot(ldata)

#Crit value -3.50
#urlwage=ur.df(lwage, type="trend",lags=8, selectlags="AIC")
#summary(urlwage)
#Value of test-statistic is: -0.1016 14.5899 15.5916 

#urll=ur.df(ll, type="trend",lags=8, selectlags="AIC")
#summary(urll)
#Value of test-statistic is: -2.0625 2.2842 3.2095

#urle=ur.df(le, type="trend", lags=8, selectlags="AIC")
#summary(urle)
#Value of test-statistic is: -2.6597 3.1589 3.5369 

#urlp=ur.df(lp, type="trend",lags=3, selectlags="AIC")
#summary(urlp)
#Value of test-statistic is: 1.1579 3.6324 4.0874 

#urlgdp=ur.df(lgdp, type="trend",lags=3, selectlags="AIC")
#summary(urlgdp)
#Value of test-statistic is: -1.9487 82.7289 18.6131 





library(dynlm)
#mod=dynlm(diff(

#lwage.p=cbind(lwage,lp)
#clwage=ca.po(lwage.p, type="Pz")
#summary(clwage)

#crwage=lm(lwage - lp ~ )
#summary(crwage)

#sezoniškumo iš GDP panaikinimas
gdpsez=decompose(gdp)$season   
ggdp=gdp-gdpsez

ldata=log(data)
lwage=ldata[,'wage']
le=ldata[,'e']
ll=ldata[,'l']
lp=ldata[,'p']
lgdp=ldata[,'gdp']

lggdp=log(ggdp)





##






