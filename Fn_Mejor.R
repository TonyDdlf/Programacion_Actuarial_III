Mejor <- function(es, res){
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  completo <- tapply(outcome$Hospital.Name, outcome$State, list)
  nombre <- names(completo)
  numero <- which(nombre == es)
  if (res == "ataque al corazon"){
    dez <- tapply(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, outcome$State, list)
  } else if (res == "falla cardiaca"){
    dez <- tapply(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, outcome$State, list)
  } else if (res == "neumonia"){
    dez <- tapply(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, outcome$State, list)
  } else{
    print("Enfermedad no válida")
    break
  }
  if (!is.na(match(es, outcome$State)) == T) {
    zz <- dez[numero]
    zz <- as.numeric(unlist(zz))
    orden <- order(unlist(zz))
    bett <- orden[1]
    z <- unlist(completo[numero])
    z[bett]
  } else {
    print("Siglas del estado incorrecto")
  }
}
