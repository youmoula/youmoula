 mpg <- c(2,3,5,7,3.2,2.5,4.1)
 mpg <- sort(mpg)
 ngroups = 2
 df <- data.frame(mpg=mpg, group=seq(length(mpg))%%ngroups)
 #tapply(df$mpg, df$group, mean)

 #df <- data.frame(User=1:1000,Data=rnorm(1000,0,1)) 
 myfun = function(){
     k <- 2 
     tmp <- seq(length(mpg))%%k                   
     thisgroup <- sample(tmp, dim(df)[1], FALSE) 
# thisgroup <- sample(1:k,dim(df)[1],TRUE)  
     thisavg <- as.vector(by(df$mpg, thisgroup, mean)) # group means
     thisvar <- var(thisavg)                            # variance of means
     return(list(group=thisgroup, avgs=thisavg, var=thisvar))
 }
 
 n <- 24
 sorts <- replicate(n, myfun(), simplify=FALSE)
 wh <- which.min(sapply(sorts, function(x) x$var))
 split(df, sorts[[wh]]$group)

 DF <- data.frame(V1=c(2,8,1),V2=c(7,3,5),V3=c(9,6,4))
colnames(DF)[apply(DF,1,which.max)]

##===========**************========
##===========**************========

t <- c(22,8,15,1,2.2,2.3,0.8)
n <- 3
ngroup<- vector("list",n)
arp = function(rt,rn,ngroup){
if(rn==1){
ngroup[[rn]]<-rt
#print(rn)
return(ngroup)
}
ngroup[[rn]]<-sample(rt,sample(seq(length(rt)-rn)),FALSE)
print(ngroup[[rn]])
arp(setdiff(rt,ngroup[[rn]]),rn-1,ngroup)
}
gfun = function(){
tavg <- mean(t)
ngroup <-arp(t,n,ngroup)
gs <- 0
for( g in ngroup){
gs <- gs +(sum(g)-tavg)
}
thisvar <- var(gs)
return(list(group=ngroup,sums=gs,var=thisvar))
}
r<-(length(t)-1)^2
sorts <- replicate(r, gfun(), simplify=FALSE)
wh <- which.min(sapply(sorts, function(x) x$sums))
sorts[[wh]]
