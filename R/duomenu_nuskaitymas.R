p2=read.csv2(file.choose())
e2=read.csv2(file.choose())
gdp2=read.csv2(file.choose())
plf2=read.csv2(file.choose())
wage2=read.csv2(file.choose())

Taciau paimame visus tik nuo 2000K1 iki 2008K4

Su ciklais priskirsime atitinkamas reiskmes, kad liktu tik metai nuo 2000 iki 2008


p=c(1:36)
for(i in 1:36){p[i]=p2[36+i,2]}

ai cia daug visokiu komandu reik :))
e=c(1:36)
for(i in 1:36){e[i]=e3[8+i]}

gdp=c(1:36)
for(i in 1:36){gdp[i]=gdp2[28+i,2]}

cia irgi daug visokiu komandu
plf=c(1:36)
for(i in 1:36){plf[i]=plf4[8+i]}



na dar ir wage prisiskiriam ir tada jau darom :)




pav=read.delim2("clipboard",header=T)

write.csv2(wage,'C:/Documents and Settings/Povilas/Desktop/kursinis darbas/Data/wage.txt',quote=F) 

uzimtumas=read.csv2(file.choose())

write.csv2(data,'C:/Documents and Settings/Povilas/Desktop/kursinis darbas/Data/data.txt',quote=F,row.names=F) 
wager=read.csv2(file.choose())

for(i in 1:82){vk[i]=(vki[3*(i-1)+1,2]+vki[3*(i-1)+2,2]+vki[3*(i-1)+3,2])/3}
