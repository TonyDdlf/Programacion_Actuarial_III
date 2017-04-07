corr<- function(directorio, horizonte=0){
  id<- 1:332
  id
  relacion<- vector("numeric")
  final<- vector("numeric")
  #setwd(directorio)
  for (i in id){
    leer <- read.csv(paste(sprintf("%03d", i), ".csv", sep = ""))
    combinar<- cbind(leer[, 2:3])
    casoscomp<- complete.cases(leer)
    cas<- leer[casoscomp, ]
    cont<- nrow(cas)
    if(cont>=horizonte){
      relacion<- cor(cas[2],cas[3])
      vec<- as.vector(relacion)
      final<- c(final, vec)
    }
  }
  final
}