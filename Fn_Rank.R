rankhospital <- function(es, enfermedad, rango){
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  completo <- tapply(outcome$Hospital.Name, outcome$State, list)
  nombre <- names(completo)
  numero <- which(nombre == es)
  if (rango == "mejor"){
    rango <- 1
  }
  if (enfermedad == "ataque al corazon"){
    dez <- tapply(outcome[,11], outcome$State, list)
  } else if (enfermedad == "falla cardiaca"){
    dez <- tapply(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, outcome$State, list)
  } else if (enfermedad == "neumonia"){
    dez <- tapply(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, outcome$State, list)
  } else{
    print("Enfermedad no válida")
    break
  }
  if (rango <= length(unlist(completo[numero]))){
    if (!is.na(match(es, outcome$State)) == T) {
      zz <- dez[numero]
      zz <- as.numeric(unlist(zz))
      orden <- order(unlist(zz))
      bett <- orden[rango]
      z <- unlist(completo[numero])
      z[bett]    
    } else {
      print("Siglas del estado incorrecto")
    }
  } else {
    print("Rango del hospital mayor al existente en el estado elegído")
  }
}