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
l=data[,'l']
p=data[,'p']
gdp=data[,'gdp']

#---------------------------------------------------------------------#

#Duomenu logaritmai#
#---------------------------------------------------------------------#

ldata=log(data)
lwage=ldata[,'wage']
le=ldata[,'e']
ll=ldata[,'l']
lp=ldata[,'p']
lgdp=ldata[,'gdp']
#---------------------------------------------------------------------#

#Nuimtas sezoniskumas#
#---------------------------------------------------------------------#
gdpsez=decompose(gdp)$season   
ggdp=gdp-gdpsez
lggdp=log(ggdp)
#---------------------------------------------------------------------#

#Duomenu skirtumai#
#---------------------------------------------------------------------#
dlwage=diff(lwage)
dlp=diff(lp)
dle=diff(le)
dlggdp=diff(lggdp)
dll=diff(ll)
#---------------------------------------------------------------------#

#Bedarbiai, nedarbo lygis, uzimtumo lygis, nasumas -log ir diff#
#---------------------------------------------------------------------#
u=l-e
ur=u/l
lur=log(ur)
dlur=diff(lur)

# Uzimtumas
er=1-ur
ler=log(er)
dler=diff(ler)

#Darbo nasumas#
n=ggdp/e*1000
ln=log(n)
dln=diff(ln)

# Laiko trendas
tt=time(lwage)
ltt=log(tt)
#---------------------------------------------------------------------#

# Vienetines saknys
#---------------------------------------------------------------------#

# urlwage=ur.df(lwage, type="trend",lags=5, selectlags="AIC")
# summary(urlwage)
# 
# urll=ur.df(ll, type="trend",lags=5, selectlags="AIC")
# summary(urll)
# 
# urle=ur.df(le, type="trend", lags=5, selectlags="AIC")
# summary(urle)
# 
# urlp=ur.df(lp, type="trend",lags=5, selectlags="AIC")
# summary(urlp)
# 
# urlggdp=ur.df(lggdp, type="trend",lags=8, selectlags="AIC")
# summary(urlggdp)

# urler=ur.df(ler, type="trend",lags=8, selectlags="AIC")
# summary(urler)

# urln=ur.df(ln, type="trend",lags=8, selectlags="AIC")
# summary(urln)

#Autoregresinis wage modelis#-----------------------------------------------

# Pirmiausia istirsime ar lwage turi vienetine sakni:
  
# urlwage=ur.df(lwage, type="drift",lags=5, selectlags="AIC")
# summary(urlwage)
# Kadangi t stat=-1.15>-3.5, tai turi vienetine sakni.
# Taigi naudosime auto.arima funkcija su parametru d=1, t.y. sudarysime modeli skirtumam, kadangi jie yra stacionarus

arlwage=auto.arima(lwage,d=1,max.Q=0,max.P=0)
#  summary(arlwage)

# Auto Arima mums siulo Arima(0,1,0)
# Pagal tsdisplay mums siulo taip pat AR(1) modeli, taciau kadangi istyreme, jog lwage turi vienetine sakni, tai reiskia, kad yra Arima(0,1,0)

arlwage2=arima(lwage, order=c(0,1,0), include.drift=TRUE)

# Pagal TS display ir zmogiska logika nusprendziam pameginti AR(4) procesa skirtumam

arlwage3=dynlm(dlwage~ L(dlwage,4))

# Perkeitimas nuo skirtimu prie tiesiog logoritmu

# Geriausias tai sitas: Panasus i 3
arlwage5=arima(dlwage, order=c(4,0,0))
arlwage7=arima(lwage, order=c(4,1,0),include.mean=TRUE)

# Pagal eksponentini glodinima:
forecast(ets(lwage),8)
plot(forecast(ets(lwage),8), main='Darbo užmokesč io prognozė  remiantis eksp. glodinimu')

# ECM 1 modelis # ---------------------------------------------------------------------

# Kointegracijos lygtis:
ko1=lm(lwage ~ lp + ler)
#  summary(ko1)
ko1r=ts(ko1$res,start=2000,freq=4)
# Patikrinam ar yra stacionarios liekanos

# summary(dynlm(d(ko1r)~-1+L(ko1r)+L(d(ko1r),1:4)))
# Kadangi -4.225 < crit value=-3.74, tai nera vienetines saknies, kas reiskia, kad liekanos stacionarus ir procesai koointegruoti, tada sudarome ECM modeli
# Sudarome ECM 1 modeli:

ecm1.1 = dynlm(dlwage~ ltt + L(ko1r) + L(dlwage,1:4) + L(dlp,0:4)+ L(dler,0:4))
# summary(ecm1.1)
# ^^ cia pasalinam poto nereiksmingus ir gauname, kas zemiau parasyta
#del sito reikia paklausti (ar salinti po viena nuo labiausiai nereiksmingo, ar salinti iskarto visus nereiksmingus)

ecm1.2 = dynlm(dlwage~ L(ko1r) + L(dlwage,1:4) + L(dlp,0:4)+ L(dler,0))
# summary(ecm1.2)

# Jei atmetinesime kintamuosius, pradedant nuo labiausiai nereiskmingu tai:Geriausias modelis gaunasi
ecm1.3 = dynlm(dlwage~  L(ko1r) + L(dlp,0))
#  summary(ecm1.3)


# ECM 2 modelis # ---------------------------------------------------------------------

# Kointegracijos lygtis:
ko2=lm(lwage ~ lp + ler + ln)
# summary(ko2)
ko2r=ts(ko2$res,start=2000,freq=4)
# Patikrinam ar yra stacionarios liekanos

 summary(dynlm(d(ko2r)~-1+L(ko2r)+L(d(ko2r),1:4)))

# Kadangi -3.991 < crit value=-3.74, tai nera vienetines saknies, kas reiskia, kad liekanos stacionarus ir procesai koointegruoti, tada sudarome ECM modeli
# Sudarome ECM 2 modeli:
ecm2.1 = dynlm(dlwage~ ltt + L(ko2r) + L(dlwage,1:5) + L(dlp,0:5)+ L(dler,0:5) + L(dln,0:5))
# summary(ecm2.1)

# Taikom ta pacia procedura kaip ir pries tai ir prieiname prie sitokio modelio:
ecm2.2 = dynlm(dlwage~  L(ko2r) + L(dlwage,1:4) + L(dlp,0:4)+ L(dler,0) + L(dln,0))
summary(ecm2.2)

# Cia beveik tas pats modelis, tik jau pasalintas nasumas isvis MANAU SITAS GERIAUSIAS
ecm2.3 = dynlm(dlwage~  L(ko2r) + L(dlwage,1:4) + L(dlp,0:4)+ L(dler,0))
summary(ecm2.3)

# O jeigu atmetinetumem po 1 nuo labiausiai nereiskmingo, tai:Geriausias modelis gaunasi: Sito R squared = 0.4207, AIC = -160.0601
ecm2.4 = dynlm(dlwage~  L(ko2r) + L(dlwage,1)+ L(dlwage,4) + L(dlp,0:1)+ L(dlp,4)+ L(dler,2:3) + L(dln,0)+ L(dln,4:5))
summary(ecm2.4)