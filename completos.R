completos <- function(directorio, id = 1:332){
    direc <- paste(getwd(), "/", directorio, sep="")
    coma <- paste(sprintf("%03d", id), ".csv", sep="")
    for (i in id){
    y <- read.csv(coma[i-id[1]+1])
        NNA1 <- !is.na(y$sulfate)
        NNA2 <- !is.na(y$nitrate)
        z <- c(sum(NNA1*NNA2), z)
    }
    data.frame(id, z[length(coma):1])
}
completos("specdata", 112:332)