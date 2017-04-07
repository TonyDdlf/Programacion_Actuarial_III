mediacontaminante <- function(directorio,contaminante,id=1:332){
    direc <- paste(getwd(), "/", directorio, sep="")
    plztakemehome <- getwd()
    setwd(direc)
    coma <- paste(sprintf("%03d", id), ".csv", sep="")
    dat <- list()
    coma
    length(coma)
    for (i in 1:length(coma)){
        y <- read.csv(coma[i])
    }
    setwd(plztakemehome)
}
setwd("/Users/anarendon/Desktop/programacion 3/")
mediacontaminante("specdata", "sulfate", 1:5)
setwd("specdata")
coma <- paste(sprintf("%03d", 1:3), ".csv", sep="")
for (i in 1:length(coma)){
    y <- read.csv(coma[i])
    z <- y$nitrate
}
z
unsplit(lapply(dat, mean, na.omit(dat)), f)
dat
f<- gl(length(coma), 1)
f
?class
z <- unclass(dat)
z[1:4]
class(z)