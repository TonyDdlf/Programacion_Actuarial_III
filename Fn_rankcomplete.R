rankingcompleto <- function(enfermedad, rango = 1){
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  estado <- names(tapply(outcome$Hospital.Name,outcome$State, list))
  nom_hos <- tapply(outcome$Hospital.Name, outcome$State, list)
  vec_hos <- c()
  if (rango == "mejor"){
    rango <- 1
  }
  if (enfermedad == "ataque al corazon"){
    tasa <- tapply(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, outcome$State, list)
  } else if (enfermedad == "falla cardiaca"){
    tasa <- tapply(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, outcome$State, list)
  } else if (enfermedad == "neumonia"){
    tasa <- tapply(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, outcome$State, list)
  } else {
    print("Enfermedad no válida")
    break(rankingcompleto)
  }
  for (i in (1:54)){
    rate_est <- unlist(tasa[i])
    hos_est <- nom_hos[i]
    orden <- order(rate_est, na.last = T)
    m_bajo <- orden[rango]
    m_mejor <- unlist(nom_hos[i])
    vec_hos <- c(vec_hos, m_mejor[rango])
  }
  result <- data.frame(vec_hos, estado)
  names(result) <- c("Hospital", "Estado")
  result
}