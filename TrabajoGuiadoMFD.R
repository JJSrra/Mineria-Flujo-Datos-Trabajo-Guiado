## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
poblacionNaiveBayes = array(dim = 30)
for (i in 1:30) {
  archivo =
    paste(c(paste(c("./Datos/Ejercicio1/naiveBayes",i),collapse = ""),".csv"),collapse="")
  datos = read.csv(archivo)
  accuracyFinal =
    datos$classifications.correct..percent.[length(datos$classifications.correct..percent.)]
  poblacionNaiveBayes[i] = accuracyFinal
}

## ------------------------------------------------------------------------
poblacionHoeffding = array(dim = 30)
for (i in 1:30) {
  archivo =
    paste(c(paste(c("./Datos/Ejercicio1/hoeffding",i),collapse = ""),".csv"),collapse="")
  datos = read.csv(archivo)
  accuracyFinal =
    datos$classifications.correct..percent.[length(datos$classifications.correct..percent.)]
  poblacionHoeffding[i] = accuracyFinal
}

## ------------------------------------------------------------------------
shapiro.test(poblacionNaiveBayes)
shapiro.test(poblacionHoeffding)

## ------------------------------------------------------------------------
t.test(poblacionNaiveBayes, poblacionHoeffding)

## ------------------------------------------------------------------------
conceptDrift1 = read.csv("Datos/Ejercicio2/conceptDrift1.csv")

# Mostrar el acierto del clasificador en el tiempo
plot(conceptDrift1$learning.evaluation.instances,
     conceptDrift1$classifications.correct..percent.,
     "l", ylim = c(0,100), col = "red")

# Mostrar el último valor de accuracy y kappa junto a los valores medios
conceptDrift1$classifications.correct..percent.[
  length(conceptDrift1$classifications.correct..percent.)]
mean(conceptDrift1$classifications.correct..percent.)

conceptDrift1$Kappa.Statistic..percent.[
  length(conceptDrift1$Kappa.Statistic..percent.)]
mean(conceptDrift1$Kappa.Statistic..percent.)

## ------------------------------------------------------------------------
conceptDrift3 = read.csv("Datos/Ejercicio4/conceptDrift3.csv")

# Mostrar el último valor de accuracy y kappa junto a los valores medios
conceptDrift3$classifications.correct..percent.[length(conceptDrift3$classifications.correct..percent.)]
mean(conceptDrift3$classifications.correct..percent.)

conceptDrift3$Kappa.Statistic..percent.[length(conceptDrift3$Kappa.Statistic..percent.)]
mean(conceptDrift3$Kappa.Statistic..percent.)

